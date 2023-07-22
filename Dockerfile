FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DB_NAME=postgres
ENV DB_USER=postgres
ENV DB_PASSWORD=your_password
ENV DB_HOST=db
ENV DB_PORT=5432


RUN apt-get update \
    && apt-get install -y libpq-dev gcc \
    && pip install --upgrade pip \
    && pip install psycopg2-binary \
    && pip install django

WORKDIR /app

COPY . /app/

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

