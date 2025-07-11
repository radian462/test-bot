FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN adduser --uid 10001 --disabled-password --gecos '' appuser
USER 10001
CMD ["python", "main.py"]
