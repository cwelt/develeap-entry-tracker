# Use Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy application code to the container
COPY app.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

ENV APP_VERSION=$(git tag --sort=-committerdate | head -n 1)

# Expose the application port
EXPOSE 5000

# Run the Flask app
ENTRYPOINT ["python", "app.py"]
