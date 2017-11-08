# Installation and development

## Ruby

Needs Ruby 2.4.1.

## System dependencies

```
# ExecJS runtime
$ sudo apt-get install nodejs

# PostgreSQL
$ sudo apt-get install postgresql postgresql-contrib libpq-dev

# rugged
$ sudo apt-get install cmake pkg-config
```

## Application setup

Assuming your user is able to create databases, for example by running

```
$ sudo -u postgres createuser --superuser $USER
```

just execute

```
$ bin/setup
```

## Developing locally

To populate an empty database:

```
bin/rails runner Repo.sync
```

If you modify the name mappings, hard-coded authors, etc., that task also
updates the credits and it does so changing as little as possible.

Sometimes you may need to rebuild the assignments, for example if the actual
heuristics change. To do that please execute

```
bin/rails runner "Repo.sync(rebuild_all: true)"
```

## Test suite

To run the test suite execute

```
$ bin/rails test
```

Recent tests may need an up to date checkout of Rails. To do so:

```
$ cd rails.git
$ git fetch
```
