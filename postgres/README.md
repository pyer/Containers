# docker-postgres

Docker image Alpine 3.7 Postgres 10.5


## Usage

Port 5433 is used to avoid conflict with Postgres server on the same host


### Server

**With persistent data:**

Assuming <pg_data> is a full path directory name, launch Postgres server with the command

`docker run --name="postgres" -d -v <pg_data>:/home -p 5433:5432 pyer/postgres`


**Without persistent data:**

`docker run --name="postgres" -d -p 5433:5432 pyer/postgres`


### Client

**Connect to Postgres server with psql if psql is present on the host:**

`psql -U postgres -h localhost -p 5433`

**Connect with docker:**

`docker exec -ti postgres psql -U postgres`


### First run

Default database (initdb) is created and configuration (postgresql.conf) is updated at the first run


## Build

`docker build --rm -t pyer/postgres .`


## Debug

When Postgres server in interactive mode, logs are displayed on the console

`docker run --name="postgres" --rm -ti -p 5433:5432 pyer/postgres`

