From python:3.8.2-alpine
MAINTAINER amir


ENV PYTHONUNBUFFERED 1


ADD ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
ADD ./app /app


RUN adduser -D user
USER user

