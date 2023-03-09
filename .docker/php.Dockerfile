# syntax=docker/dockerfile:1

FROM php:8.2.3-fpm-bullseye
WORKDIR /srv/laravel
RUN pecl install redis
RUN docker-php-ext-enable redis
RUN docker-php-ext-enable opcache
RUN apt update
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install pdo_pgsql
RUN apt install -y libzip-dev
RUN docker-php-ext-install zip
RUN rm -rf /srv
COPY . .
RUN cp .env.local .env
COPY --from=composer:2.5.4 /usr/bin/composer /usr/bin/composer
RUN composer install
RUN php artisan key:generate
RUN chmod o+w storage/logs
RUN chmod o+w bootstrap/cache
RUN chmod o+w storage/framework/sessions
RUN chmod o+w storage/framework/views
