FROM python:3.9.10

ENV PYTHONUNBUFFERED 1

WORKDIR /task

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .
