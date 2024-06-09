FROM jupyter/base-notebook:latest

# Instalar bibliotecas de NLP
RUN pip install --upgrade pip
RUN pip install numpy pandas scikit-learn nltk spacy
RUN python -m nltk.downloader all
RUN python -m spacy download en_core_web_sm

# Copiar el archivo de configuración de Jupyter
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/

# Exponer el puerto para Jupyter
EXPOSE 8888
