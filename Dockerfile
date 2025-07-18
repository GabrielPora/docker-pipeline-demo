# Use official Python base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Default env (can be overridden by docker-compose or .env)
ENV HOST=0.0.0.0
ENV PORT=8080
ENV RELOAD=False

# Run Uvicorn server
# If you do not want the build to run comment out the below line
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
