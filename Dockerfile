# Use the official Nginx image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy the HTML files
COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
COPY ondc-site-verification.html /usr/share/nginx/html/

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Override the default Nginx configuration (if needed)
COPY nginx.conf /etc/nginx/nginx.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

# # Use the official Python image
# FROM python:3.9-slim
# # Set working directory
# WORKDIR /app
# # Copy requirements and install dependencies
# COPY requirements.txt /app/
# RUN pip install -r requirements.txt
# # Copy the app and the HTML file
# COPY app.py /app/
# COPY index.html /app/
# COPY ondc-site-verification.html /app/new/
# # Expose port 8080 for Cloud Run
# EXPOSE 8080
# # Run the app
# CMD ["python", "app.py"]
