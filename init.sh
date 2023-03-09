git clone https://github.com/oorcun/docker.git .
docker run -d --name php oorcun/laravel:php
docker cp php:/srv/laravel/.env .env
docker cp php:/srv/laravel/vendor vendor
docker rm -f php
printf "\nDOCKER_USER_ID=$(id -u)\nDOCKER_GROUP_ID=$(id -g)\n" >> .env
rm init.sh

#chanhe local and build
#init script where
