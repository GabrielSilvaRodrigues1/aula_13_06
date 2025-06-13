FROM php:8.2-apache

# Instala extensões necessárias
RUN docker-php-ext-install pdo pdo_mysql

# Habilita .htaccess e reescrita de URL se quiser futuramente
RUN a2enmod rewrite

# Instala o Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copia os arquivos do projeto para o container
COPY . /var/www/html

# Define o diretório raiz do Apache
WORKDIR /var/www/html

# Instala as dependências do Composer dentro do container
RUN composer install

# Copia configurações personalizadas do PHP (opcional)
COPY ./docker/php.ini /usr/local/etc/php/