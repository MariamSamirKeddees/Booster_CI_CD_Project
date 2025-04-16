FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000
ENV PYTHONUNBUFFERED=1

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
