# Running a Rails Development Environment in Docker

## 1. Create a rails new project with postgresql

### Web
Run:
```shell
docker-compose run web rails new . --force --no-deps --database=postgresql
```
### Api
Run:
```shell
docker-compose run web rails new . --force --no-deps --database=postgresql --api
```

* `--force` Overwrite files that already exist.
* `--no-deps` Flag tells compose not to start dependent services.

## 2. Build

Now that you’ve got a new `Gemfile`, you need to build the image again. 

```shell
docker-compose build
```

## 3. Set database setting

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: postgres
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
```

## 4. Deploy

```shell
docker-compose up
```

> go to link `localhost:3000`

## 5. Create database

```shell
docker-compose run web rails db:create
```

## 6. Create User model and run migrations

```shell
docker-compose run web rails g scaffold user name last_name username age:integer
```

```shell
docker-compose run web rails db:migrate
```

> go to link `localhost:3000/users`

### Do you want to connect to the database?

```shell
docker exec -ti rails_db_1 bash -c "psql -U postgres"
```
### Do you want to connect to the rails console?

```shell
docker-compose run web rails c
```

### Detele containers

```shell
docker-compose down
```
