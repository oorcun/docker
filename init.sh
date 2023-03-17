git clone git@github.com:oorcun/docker.git new
cd new
cp .env.local .env
printf "\nDOCKER_USER_ID=$(id -u)\nDOCKER_GROUP_ID=$(id -g)\n" >> .env
docker compose up -d
docker exec php composer install
docker exec php php artisan key:generate
rm ../init.sh
