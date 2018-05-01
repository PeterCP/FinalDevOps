# Use ubuntu latest as the base image.
FROM ubuntu:latest

# Install the apache2 package from apt.
RUN apt-get update && \
    apt-get install -y apache2

# Expose web server ports
EXPOSE 80 443

# Redirect apache logs to stdout and stderr so that docker
# can handle logging.
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log && \

# Setup apache directories.
    mkdir -p /var/lock/apache2 && \
    mkdir -p /var/run/apache2

# Setup apache environment variables.
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

# Add index.html to the image.
WORKDIR /var/www/html
COPY index.html index.html

# Start the apache2 service.
ENTRYPOINT exec /usr/sbin/apache2 -DFOREGROUND
