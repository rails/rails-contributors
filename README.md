# Rails Contributors

This is the application behind http://contributors.rubyonrails.org.

## Ruby

Needs Ruby 2.4.1.

## System dependencies

```
# ExecJS runtime
$ sudo apt-get install nodejs

# PostgreSQL
$ sudo apt-get install postgresql postgresql-contrib libpq-dev

# rugged
$ sudo apt-get install cmake
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

## Test suite

To run the test suite run

```
$ bin/rails test
```

Recent tests may need an up to date checkout if Rails. To do so

```
$ cd rails.git
$ git fetch
```

## Developing locally

To populate an empty database:

```
bundle exec rails runner Repo.sync
```

To repopulate the database based on code changes:

```
bundle exec rails runner "Repo.sync(rebuild_all: true)"
```

## License

Released under the MIT License, Copyright (c) 2012–<i>ω</i> Xavier Noria.
