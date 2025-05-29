# Nagios Core Dockerizado

Este repositorio contiene un `Dockerfile` que construye una imagen Docker personalizada con **Nagios Core**, lista para ejecutarse con Apache en el puerto 80.

---

## Requisitos

- Docker instalado en tu sistema.
- Acceso a Internet (para instalar dependencias durante la build).
- Puerto 80 libre en tu máquina o servidor.

---

## Archivos incluidos

- `Dockerfile`: define la imagen de Nagios Core sobre Ubuntu 20.04.
- `start.sh`: script que inicia Apache y el proceso principal de Nagios.
- `README.md`: este documento con instrucciones de uso.

---

## Construcción de la imagen

1. Clona este repositorio o descarga los archivos:
   bash
   git clone https://github.com/tu-usuario/nagios-docker.git
   cd nagios-docker
