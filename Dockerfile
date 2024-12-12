# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt and install dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Set environment variable for Flask
ENV FLASK_APP=app.py

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Command to run the application using Flask's built-in server
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
