FROM php:8.0-apache

WORKDIR /var/www/html

COPY . .
COPY apache2.conf /etc/apache2/apache2.conf

RUN a2enmod rewrite

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!^DocumentRoot .*!DocumentRoot ${APACHE_DOCUMENT_ROOT}!' /etc/apache2/sites-available/000-default.conf

RUN echo '<Directory /var/www/html/public>\n    AllowOverride All\n    Require all granted\n</Directory>' > /etc/apache2/conf-available/public.conf \
    && a2enconf public

EXPOSE 80

CMD ["apache2-foreground"]