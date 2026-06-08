FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Nginx, Git and Curl
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Remove default website directory
RUN rm -rf /var/www/html

# Clone website from GitHub
RUN git clone https://github.com/purith23/docker-test.git /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]