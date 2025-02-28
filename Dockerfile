FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p configs logs storage/cache storage/plugins storage/products plugins

ENV PYTHONUNBUFFERED=1
ENV TZ=Europe/Moscow

CMD ["python", "main.py"]