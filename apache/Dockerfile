FROM php:8.3-apache

ARG PHP_TIMEZONE
ARG PHP_ENABLE_UPLOADS
ARG PHP_MEMORY_LIMIT
ARG PHP_POST_MAX_SIZE
ARG PHP_UPLOAD_MAX_FILESIZE
ARG PHP_MAX_FILE_UPLOADS
ARG PHP_MAX_INPUT_TIME
ARG PHP_LOG_ERRORS
ARG PHP_ERROR_REPORTING

# mix
RUN apt-get update \
  && apt-get install -y build-essential zlib1g-dev default-mysql-client curl gnupg procps vim git unzip libzip-dev libpq-dev \
  && docker-php-ext-install zip pdo_mysql pdo_pgsql pgsql

#=== Install gd php dependencie ===
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
    docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
    docker-php-ext-install gd

# intl
RUN apt-get install -y libicu-dev \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl


RUN apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libldap2-dev libxml2-dev libzip-dev zip unzip \
    libonig-dev graphviz curl \
    && docker-php-ext-install pdo pdo_mysql mysqli ldap soap xml gd mbstring zip
    
# Xdebug
RUN pecl install xdebug \
&& docker-php-ext-enable xdebug

# pcntl
RUN docker-php-ext-install pcntl

RUN pecl install apcu \
    && docker-php-ext-enable apcu

RUN a2enmod rewrite

# session.save_path
RUN echo "session.save_path = /var/lib/php/sessions" > /usr/local/etc/php/conf.d/session.ini

WORKDIR /var/www/html
