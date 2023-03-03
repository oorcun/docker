# syntax=docker/dockerfile:1

FROM nginx:1.23.3
COPY ./conf.d /etc/nginx/conf.d
