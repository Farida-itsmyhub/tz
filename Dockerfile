FROM pytorch/pytorch:latest

RUN mkdir -p /usr/src/app/dataset/

WORKDIR /usr/src/app/

COPY requirements.txt /usr/src/app/requirements.txt

RUN apt update && apt install --no-install-recommends -y build-essential gcc

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt update && apt install -y libsm6 libxext6 && \
    apt-get install -y software-properties-common git && apt-get install -y python3-pip libxrender-dev


RUN python3 -m pip install -r requirements.txt

COPY /data_out /usr/src/app/data_out
COPY /param /usr/src/app/param
COPY start.py /usr/src/app/

RUN echo $'#!/bin/sh\n\
envsubst < /dataset > /dataset  "$@"'
RUN echo $'#!/bin/sh\n\
envsubst < param/my.pth > param/my.pth  "$@"'

CMD ["python", "start.py"]
