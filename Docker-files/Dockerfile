# Use a lightweight Python base image
FROM python:3.9-slim

# Set environment variables for security
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/home/app/.local/bin:${PATH}"

# Create a non-root user for running the application
RUN useradd --create-home app && \
    chown -R app:app /home/app

# Set working directory and switch to non-root user
WORKDIR /app
USER app

# Copy requirements file separately to leverage Docker caching
COPY --chown=app:app requirements.txt .

# Install application dependencies
RUN pip install --no-cache-dir --user -r requirements.txt

# Copy application code
COPY --chown=app:app . .

# Expose the port that Flask runs on
EXPOSE 5000

# Run the Flask application
CMD ["python", "app.py"]
