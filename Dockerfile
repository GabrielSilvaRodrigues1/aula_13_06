# Dockerfile
FROM php:8.0-apache

# Set the working directory
WORKDIR /var/www/html

# Copy the application code
COPY . .

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Expose ports
EXPOSE 80

# Set the environment variable for the Apache document root
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Update the Apache configuration
RUN sed -ri -e 's!^DocumentRoot .*!DocumentRoot ${APACHE_DOCUMENT_ROOT}!' /etc/apache2/sites-available/000-default.conf

# Command to run the application
CMD ["apache2-foreground"]