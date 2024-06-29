FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Actualizar y configurar el entorno
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configurar Python
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install --upgrade pip

# Copiar el archivo requirements.txt al contenedor
COPY requirements.txt /tmp/

# Instalar las bibliotecas desde requirements.txt
RUN pip install -r /tmp/requirements.txt

# Instalar PyTorch con soporte para CUDA
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118

# Descargar recursos adicionales para NLTK y spaCy
RUN python -m nltk.downloader all && \
    python -m spacy download es_core_news_sm

# Instalar Jupyter Notebook
RUN pip install notebook

# Crear un usuario no root
RUN useradd -m jovyan

# Copiar el archivo de configuración de Jupyter
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/

# Copiar el script de verificación
COPY check_system.py /home/jovyan/

# Crear los directorios necesarios con los permisos adecuados
RUN mkdir -p /home/jovyan/.local/share/jupyter/runtime /home/jovyan/results /home/jovyan/logs && \
    chown -R jovyan:users /home/jovyan/.local /home/jovyan/.jupyter /home/jovyan/check_system.py /home/jovyan/results /home/jovyan/logs

USER jovyan

# Exponer el puerto para jupyter
EXPOSE 8888

# Ejecutar el script de verificación al inicio y luego iniciar Jupyter Notebook
CMD ["bash", "-c", "python /home/jovyan/check_system.py && jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]
