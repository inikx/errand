# TASKER
## Database
https://dbdiagram.io/d/6213e73a485e433543f0b6db

## Server
``yarn install``
### PostgreSQL
``docker run --name tasker-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres:alpine``

``docker exec -it tasker-postgres bash``

``psql -U postgres``

``create database tasker;``

### Redis
``docker run --name redis -p 6379:6379 redis``

``docker exec -it redis redis-cli``

``config set requirepass``
