import os
import multiprocessing
import torch
import tensorflow as tf

def check_cpus():
    print("Número de CPUs (os.cpu_count()):", os.cpu_count())
    print("Número de CPUs (multiprocessing.cpu_count()):", multiprocessing.cpu_count())

def check_gpu_pytorch():
    if torch.cuda.is_available():
        print("CUDA está disponible. Número de GPUs:", torch.cuda.device_count())
        print("Nombre de la GPU:", torch.cuda.get_device_name(0))
    else:
        print("CUDA no está disponible en PyTorch.")

def check_gpu_tensorflow():
    gpus = tf.config.experimental.list_physical_devices('GPU')
    if gpus:
        print("GPUs disponibles en TensorFlow:", len(gpus))
        for gpu in gpus:
            print("Nombre de la GPU:", gpu.name)
    else:
        print("CUDA no está disponible en TensorFlow.")

if __name__ == "__main__":
    check_cpus()
    check_gpu_pytorch()
    check_gpu_tensorflow()
