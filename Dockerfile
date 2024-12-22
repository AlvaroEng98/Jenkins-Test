FROM python:3.12.7-alpine3.20 AS builder


WORKDIR /app


COPY requirements.txt /app/


RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]

