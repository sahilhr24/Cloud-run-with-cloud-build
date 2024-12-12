# Use the official Nginx base image
FROM nginx:latest

# Copy a custom index.html file to the default Nginx root directory
COPY index.html /usr/share/nginx/html/
COPY index.htm /usr/share/nginx/html/2/
COPY default.conf /etc/nginx/conf.d/

# Expose port 82
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
