FROM python:3.9

ENV PYTHONUNBUFFERED 1

COPY ./ /app

RUN pip install --upgrade pip && pip install -r requirements.txt

WORKDIR /app/com/

CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000
