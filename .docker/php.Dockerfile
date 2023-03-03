# syntax=docker/dockerfile:1

FROM php:8.2.3-fpm
RUN docker-php-ext-enable opcache
RUN rm -rf /srv
COPY . /srv/laravel
