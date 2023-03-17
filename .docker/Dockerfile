# syntax=docker/dockerfile:1

FROM nginx:1.23.3 AS nginx
COPY .docker/conf.d /etc/nginx/conf.d

FROM php:8.2.3-fpm-bullseye AS php
WORKDIR /srv/laravel
RUN pecl install redis
RUN docker-php-ext-enable redis
RUN docker-php-ext-enable opcache
RUN apt update
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql
RUN apt install -y libzip-dev
RUN apt install -y unzip
RUN apt install -y p7zip-full
RUN docker-php-ext-install zip
COPY --from=composer:2.5.4 /usr/bin/composer /usr/bin/composer

FROM php AS php-production
COPY . .
RUN composer install --optimize-autoloader --no-dev
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN php artisan route:cache
RUN php artisan event:cache
