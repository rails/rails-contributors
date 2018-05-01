# Production setup

## Ruby

Needs Ruby 2.5.

## System dependencies

```
# ExecJS runtime
$ sudo apt-get install nodejs

# PostgreSQL
$ sudo apt-get install postgresql postgresql-contrib libpq-dev

# rugged
$ sudo apt-get install cmake pkg-config
```

## Rails respository mirror

```
git clone --mirror https://github.com/rails/rails.git
```

## Ruby dependencies

```
bundle install
```

## Database setup

Assuming your user is able to create databases, for example by running

```
$ sudo -u postgres createuser --superuser $USER
```

just execute

```
$ bin/rails db:setup
```

to create the databases, and

```
$ bin/rails runner Repo.sync
```

to populate the default one.
