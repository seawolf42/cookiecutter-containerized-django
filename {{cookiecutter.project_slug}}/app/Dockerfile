FROM python:3.9.3-buster

ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y uwsgi && apt-get clean

WORKDIR /project

COPY ./requirements.txt /project
RUN pip install -r requirements.txt

ENV UWSGI_WSGI_FILE=/app/config/wsgi.py \
    UWSGI_HTTP=:8000 \
    UWSGI_MASTER=1 \
    UWSGI_HTTP_AUTO_CHUNKED=1 \
    UWSGI_HTTP_KEEPALIVE=1 \
    UWSGI_LAZY_APPS=1 \
    UWSGI_WSGI_ENV_BEHAVIOR=holy \
    UWSGI_WORKERS=2 \
    UWSGI_THREADS=4 \
    UWSGI_SHOW_CONFIG=1
