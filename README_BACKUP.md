# Running a Rails Development Environment in Docker

## 1. Create a rails new project with postgresql

### Api
Run:
```shell
docker compose run api rails new . --force --no-deps --database=postgresql --api --skip-git --skip-test
```

* `--force` Overwrite files that already exist
* `--no-deps` Flag tells compose not to start dependent services
* `--skip-git` Skip .gitignore file
* `--skip-test` Skip test files

## 2. Build

Now that you’ve got a new `Gemfile`, you need to build the image again. 

```shell
docker compose build api
```

## 3. Set database setting

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: <%= ENV.fetch('DATABASE_HOST') { 'db' } %>
  username: <%= ENV.fetch('DATABASE_USERNAME') { 'postgres' } %>
  password: <%= ENV.fetch('DATABASE_PASSWORD') { 'postgres' } %>
  pool: <%= ENV.fetch('RAILS_MAX_THREADS') { 5 } %>

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
```

## 4. Deploy

```shell
docker compose up
```

> go to link `localhost:3000`

## 5. Create database

```shell
docker compose run --rm api rails db:create
```

## 6. Create User model and run migrations

```shell
docker compose run --rm api rails g scaffold user name last_name username age:integer
```

```shell
docker compose run --rm api rails db:migrate
```

> go to link `localhost:3000/users`

### Do you want to connect to the database?

```shell
docker exec -ti rails_db_1 bash -c "psql -U postgres"
```
### Do you want to connect to the rails console?

```shell
docker compose exec api rails c
```

### Detele containers

```shell
docker compose down
```

### Restart the application

To restart the application run `docker compose up` in the project directory.

### Rebuild the application

If you make changes to the Gemfile or the Compose file to try out some different configurations, you need to rebuild. Some changes require only `docker compose up --build`, but a full rebuild requires a re-run of `docker compose run api bundle install` to sync changes in the `Gemfile.lock` to the host, followed by `docker compose up --build`.
