From python:3.8.2-alpine
MAINTAINER amir


ENV PYTHONUNBUFFERED 1


ADD ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
ADD ./app /app


RUN adduser -D user
USER user

