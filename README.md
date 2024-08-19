# Análisis de Datos de Reprogramación Celular con scRNA-seq

Este repositorio contiene el código y los scripts utilizados para el análisis de datos de RNA-seq de célula única (scRNA-seq) en el contexto de reprogramación celular de fibroblastos humanos a iPSCs.

## Contenido del Repositorio

- `preprocessing.py`: Script para el control de calidad inicial y preprocesamiento de los datos de secuenciación.
- `alignment.sh`: Script de shell para el alineamiento de lecturas usando STAR.
- `quantification.sh`: Script para la cuantificación de la expresión génica usando featureCounts.
- `analysis_notebook.ipynb`: Jupyter Notebook con el análisis completo de los datos, incluyendo la creación del objeto AnnData, normalización, clustering y visualización.

## Requisitos

Para ejecutar estos scripts, se necesitan las siguientes herramientas y bibliotecas:

- Python 3.8+
- Scanpy 1.9.1
- STAR 2.7.10a
- featureCounts (Subread 2.0.1)
- FastQC 0.11.9
- MultiQC 1.12
- mygene 3.2.2
- matplotlib 3.5.2
- seaborn 0.11.2

## Uso

1. Clone este repositorio:
2. 2. Instale las dependencias necesarias (se recomienda usar un entorno virtual).
3. Ejecute el código

Para más detalles sobre cada paso, consulte los comentarios dentro de cada notebook.

## Datos

Los datos utilizados en este análisis provienen de los datasets GSE242424 y GSE100345, disponibles en el Gene Expression Omnibus (GEO).

## Contacto

Para cualquier pregunta o comentario, por favor contacte a noecv
