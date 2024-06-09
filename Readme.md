# NLP Project

Este proyecto configura un entorno Jupyter Notebook con bibliotecas orientadas a procesamiento de lenguaje natural (NLP).

## Requisitos

- Docker
- Docker Compose

## Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu_usuario/enrique_nlp_project.git
   cd enrique_nlp_project
    ```

## Construye y levanta los servicios:

```bash
docker-compose up --build
```

## OPCION 1. Ejecutar Jupyter desde VSCODE

1. Abre o crea un archivo .ipynb en tu proyecto. Crea, si no existe, la carpeta notebooks donde se crearán los .ipynb
2. Haz clic en el nombre del kernel en la esquina superior derecha del notebook en VS Code.
3. Selecciona Existing Jupyter Server... en la lista e introduce la URL del servidor Jupyter: http://127.0.0.1:8888.


## OPCION 2. Ejecutar Jupyter desde el navegador

```bash
http://localhost:8888

```

## Bibliotecas de NLP instaladas

    numpy
    pandas
    scikit-learn
    nltk
    spacy

## Videos

1. https://www.youtube.com/watch?v=Tg1MjMIVArc
2. https://www.youtube.com/watch?v=4sWhhQwHqug&list=PLZ8REt5zt2Pn0vfJjTAPaDVSACDvnuGiG&index=4 (video 4 - obtener idea de redes convolucionales)
3. https://www.youtube.com/playlist?list=PL7HAy5R0ehQVdPVLV6pIJA9ZE2vVyLRxX (hasta X)