# Use Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy application code to the container
COPY app.py requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

ENV APP_VERSION=$(curl -s https://api.github.com/repos/cwelt/develeap-entry-tracker/git/refs/tags | jq -r '.[-1].ref' | sed 's|refs/tags/||')

# Expose the application port
EXPOSE 5000

# Run the Flask app
ENTRYPOINT ["python", "app.py"]
