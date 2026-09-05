FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

# Add --default-timeout and --retries to prevent network drops from failing the build
RUN pip install --no-cache-dir --default-timeout=100 --retries 5 -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]