# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    sudo \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Expose the port the app runs on
EXPOSE 8080

# Define environment variable
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["python3", "start.py"]
