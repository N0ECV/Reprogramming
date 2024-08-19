# Análisis de Datos de Reprogramación Celular con scRNA-seq

Este repositorio contiene el código y los scripts utilizados para el análisis de datos de RNA-seq de célula única (scRNA-seq) en el contexto de reprogramación celular de fibroblastos humanos a iPSCs. 

## Contenido del Repositorio

- `GSE100344.ipynb`: Jupyter Notebook con el análisis del dataset GSE100344, incluyendo control de calidad, procesamiento y visualización de datos.
- `GSE118258.ipynb`: Jupyter Notebook con el análisis del dataset GSE118258, incluyendo control de calidad, procesamiento y visualización de datos.
- `GSE242423.ipynb`: Jupyter Notebook con el análisis del dataset GSE242423, incluyendo procesamiento de datos proporcionados y análisis exploratorio.
- `scGPT_cell_annotation_zeroshot.ipynb`: Jupyter Notebook con el análisis de anotación celular utilizando scGPT en modo zero-shot.
- `scGPT_cell_annotation_finetuning.ipynb`: Jupyter Notebook con el análisis de anotación celular utilizando scGPT con fine-tuning.
- `scGPT_GRN.ipynb`: Jupyter Notebook para el análisis de redes de regulación génica utilizando scGPT.
- `scGPT_perturbation.ipynb`: Jupyter Notebook para el análisis de perturbaciones génicas utilizando scGPT.

## Datasets Analizados

1. GSE100344: Datos de reprogramación celular con múltiples puntos temporales.
2. GSE118258: Datos de reprogramación celular con alta resolución temporal.
3. GSE242423: Datos procesados de reprogramación celular con anotaciones detalladas.

## Requisitos

Para ejecutar estos notebooks, se necesitan las siguientes herramientas y bibliotecas:

- Python 3.8+
- Scanpy 1.9.1
- Pandas
- NumPy
- Matplotlib
- Seaborn
- scGPT (asegúrate de seguir las instrucciones de instalación específicas para scGPT)

## Uso

1. Clona este repositorio:
2. Instala las dependencias necesarias (se recomienda usar un entorno virtual).
3. Ejecuta los notebooks:
- GSE100344.ipynb
- GSE118258.ipynb
- GSE242423.ipynb
- scGPT_cell_annotation_zeroshot.ipynb
- scGPT_cell_annotation_finetuning.ipynb
- scGPT_GRN.ipynb
- scGPT_perturbation.ipynb

Para más detalles sobre cada paso, consulte los comentarios dentro de cada notebook.

## Datos

Los datos utilizados en este análisis provienen de los datasets GSE100344, GSE118258 y GSE242423, disponibles en el Gene Expression Omnibus (GEO).

## Contacto

Para cualquier pregunta o comentario, por favor contacte a noecv
