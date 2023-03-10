
## Goals

Create a compose file and init script where developers work anywhere without needing to install anything.
Create a compose file for production environment.
Create a compose file for building.

## Run

To start developing:

```
wget https://raw.githubusercontent.com/oorcun/docker/master/init.sh && chmod u+x init.sh && ./init.sh
```

To run in production:

```
wget https://raw.githubusercontent.com/oorcun/docker/master/docker-compose.production.yml
cat > .env # Copy .env file
printf "\nDOCKER_USER_ID=$(id -u)\nDOCKER_GROUP_ID=$(id -g)\n" >> .env
docker compose -f docker-compose.production.yml up -d
```
