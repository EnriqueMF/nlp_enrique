FROM jupyter/base-notebook:latest

# Actualiza pip
RUN pip install --upgrade pip


# Copiar el archivo requirements.txt al contenedor
COPY requirements.txt /tmp/

# Instala las bibliotecas desde requirements.txt
RUN pip install -r /tmp/requirements.txt

# Descargar recursos adicionales para NLTK y spaCy
RUN python -m pip install nltk
RUN python -m nltk.downloader all
RUN python -m spacy download es_core_news_sm

# Copiamos el archivo de configuración de Jupyter
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/

USER root

# Expone el puerto para jupyter
EXPOSE 8888
