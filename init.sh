git clone https://github.com/oorcun/docker.git new
cd new
docker run -d --name php oorcun/laravel:php
docker cp php:/srv/laravel/.env .env
docker cp php:/srv/laravel/vendor vendor
docker rm -f php
printf "\nDOCKER_USER_ID=$(id -u)\nDOCKER_GROUP_ID=$(id -g)\n" >> .env
chmod o+w storage/logs
chmod o+w bootstrap/cache
chmod o+w storage/framework/sessions
chmod o+w storage/framework/views
rm ../init.sh
