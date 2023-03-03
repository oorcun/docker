# syntax=docker/dockerfile:1

FROM php:8.2.3-fpm
WORKDIR /srv/laravel
RUN docker-php-ext-enable opcache
RUN rm -rf /srv
COPY . .
RUN cp .env.example .env
RUN chmod o+w storage/logs && chmod o+w storage/framework/sessions && chmod o+w storage/framework/views
COPY --from=composer:2.5.4 /usr/bin/composer /usr/bin/composer
RUN apt update && apt install -y libzip-dev
RUN docker-php-ext-install zip
RUN composer install
RUN php artisan key:generate
