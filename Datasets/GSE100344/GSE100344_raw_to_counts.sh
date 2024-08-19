#!/bin/bash

# Script para procesar datos de RNA-seq del dataset GSE100344

# Definir variables
BASE_DIR="/Volumes/BioinforSSD/DATASETS_JUNE/GSE100344"
GENOME_DIR="${BASE_DIR}/genome"
FASTERQ_DIR="${BASE_DIR}/1_fasterq-dump"
TRIMMED_DIR="${BASE_DIR}/trimmed_reads"
STAR_DIR="${BASE_DIR}/2_STAR_alignment"
FASTQC_DIR="${TRIMMED_DIR}/fastqc_reports"

# Crear directorios necesarios
mkdir -p ${FASTERQ_DIR} ${TRIMMED_DIR} ${STAR_DIR} ${FASTQC_DIR}

# Descargar datos con fasterq-dump
while read -r accession; do 
    fasterq-dump "$accession" -O ${FASTERQ_DIR} --split-files --threads 10 -p
done < SRR_Acc_List.txt

# Realizar fastqc y multiqc en los datos crudos
fastqc ${FASTERQ_DIR}/*.fastq -o ${FASTQC_DIR}
multiqc ${FASTQC_DIR} -o ${FASTQC_DIR}

# Trimming con TrimGalore
for sample in ${FASTERQ_DIR}/*_1.fastq; do
    base=$(basename "$sample" _1.fastq)
    trim_galore --paired --nextera --quality 20 --length 36 -j 12 \
                -o ${TRIMMED_DIR} \
                ${FASTERQ_DIR}/${base}_1.fastq \
                ${FASTERQ_DIR}/${base}_2.fastq
done

# Realizar fastqc y multiqc en los datos despuás del trimming
fastqc ${TRIMMED_DIR}/*_val_*.fq -o ${FASTQC_DIR}
multiqc ${FASTQC_DIR} -o ${FASTQC_DIR}

# Descomprimir archivos del genoma 
gunzip -k ${GENOME_DIR}/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
gunzip -k ${GENOME_DIR}/Homo_sapiens.GRCh38.111.chr.gtf.gz

# Indexar el genoma con STAR
STAR --runMode genomeGenerate \
    --runThreadN 14 \
    --genomeDir ${GENOME_DIR}/GRCh38_index_latest \
    --genomeFastaFiles ${GENOME_DIR}/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
    --sjdbGTFfile ${GENOME_DIR}/Homo_sapiens.GRCh38.109.gtf \
    --sjdbOverhang 99 \
    --genomeSAindexNbases 14 \
    --sjdbGTFfeatureExon exon \
    --sjdbGTFtagExonParentTranscript transcript_id \
    --sjdbGTFtagExonParentGene gene_id

# Alineamiento con STAR
for sample in ${TRIMMED_DIR}/*_1_val_1.fq; do
    base=$(basename ${sample} _1_val_1.fq)
    STAR --runThreadN 14 \
         --genomeDir ${GENOME_DIR}/GRCh38_index_latest \
         --readFilesIn ${TRIMMED_DIR}/${base}_1_val_1.fq ${TRIMMED_DIR}/${base}_2_val_2.fq \
         --outFileNamePrefix ${STAR_DIR}/${base}_ \
         --outSAMtype BAM SortedByCoordinate
done

# Cuantificación con featureCounts
featureCounts -T 14 -p -t exon -g gene_id \
    -a ${GENOME_DIR}/Homo_sapiens.GRCh38.112.gtf \
    -o ${BASE_DIR}/gene_counts.txt \
    ${STAR_DIR}/*.bam

echo "Procesamiento completo. Los conteos de genes están en ${BASE_DIR}/gene_counts.txt"