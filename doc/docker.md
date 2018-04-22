# Development with Docker

## Bootstrap project

If you just cloned the project:

```
$ docker-compose up -d
$ docker/exec bundle install
$ docker/rails db:setup
$ docker/sync
```

The last command is going to clone the Rails repository and populate the database, it takes several minutes.

## Development

To develop you need to start the services:

```
docker-compose start
```

When done, stop them:

```
docker-compose stop
```

A number of convenience scripts are located in the `docker` directory, all of them operate in the main `app` container:

| Command         | Description                |
| --------------- | -------------------------- |
| `docker/bash    | Gets a Bash shell          |
| `docker/psql`   | Gets a `psql` shell        |
| `docker/rails`  | Runs `bin/rails`           |
| `docker/server` | Launches Puma in port 3000 |
| `docker/sync`   | Syncs the database         |

The commands `docker/server` and `docker/psql` are convenience wrappers around `docker/rails`. In general `docker/rails` is the main command:

```
$ docker/rails test
$ docker/rails console
$ docker/rails db:migrate
$ docker/rails runner 'p Commit.count'
$ ...
```

If you modify the name mappings, hard-coded authors, etc., `docker/sync`
updates the credits and it does so changing as little as possible. The command also accepts an optional argument `all`, which forces the recomputation of all assignments. This is handy when you've changed the heuristics, and it takes less than a full database rebuild, since it does not reimport the commits themselves (which is costly).

## Rails repository mirror

The application assumes `rails.git` is present in the root directory with a mirror of the repository:

```
git clone --mirror https://github.com/rails/rails.git
```

That clone is performed by `docker/sync` automatically, but it does not update itself. To do so, please run

```
$ cd rails.git
$ git fetch
```

whenever you need to get the most recent commits.

## Database persistence

The database is stored in a volume and persists even if you take the containers down with `docker-compose down`. If you want to remove the volume and start from scratch please pass `-v` to the command.

## Production is not affected

The production server does not run Docker, you can safely tweak the Docker setup without fear of breaking production.
