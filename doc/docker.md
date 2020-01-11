# Development with Docker

## Bootstrap project

If you just cloned the project:

```
$ docker-compose up -d
$ dc/exec bundle install
$ dc/rails db:setup
$ dc/sync
```

The last command is going to clone the Rails repository and populate the database, it takes several minutes.

## Rails repository mirror

The application assumes `rails.git` is present in the root directory with a mirror of the repository:

```
git clone --mirror https://github.com/rails/rails.git
```

That clone is performed by `dc/sync` automatically, but it does not update itself. To do so, please run

```
$ cd rails.git
$ git fetch
```

whenever you need to get the most recent commits.

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
| `dc/bash`   | Gets a Bash shell          |
| `dc/psql`   | Gets a `psql` shell        |
| `dc/rails`  | Runs `bin/rails`           |
| `dc/server` | Launches Puma in port 3000 |
| `dc/sync`   | Syncs the database         |
| `dc/deploy` | Deploys the application    |

The commands `dc/server` and `dc/psql` are convenience wrappers around `dc/rails`. In general `dc/rails` is the main command:

```
$ dc/rails test
$ dc/rails console
$ dc/rails db:migrate
$ dc/rails runner 'p Commit.count'
$ ...
```

The command `dc/server staging` runs the application in `staging` mode. That is a production-like environment (`config/environments/staging.rb` is a symlink to `config/environments/production.rb`), but it uses the development database and serves static files. If there are changes that act differently in `development` and `production`, this execution mode may be useful for checking things up before deployment.

To update the local Rails checkout and update the credits run `dc/sync`. The command also accepts an optional argument `all`, which forces the recomputation of all assignments. This is handy when you've changed the heuristics, and it takes less than a full database rebuild, since it does not reimport the commits themselves (which is costly).

## Database persistence

The database is stored in a volume and persists even if you take the containers down with `docker-compose down`. If you want to remove the volume and start from scratch please pass `-v` to the command.

## Production is not affected

The production server does not run Docker, you can safely tweak the Docker setup without fear of breaking production.
