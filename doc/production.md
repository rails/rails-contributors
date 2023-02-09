# Production setup

## Ruby

Needs Ruby 2.7.7.

## System dependencies

```
# ExecJS runtime
$ sudo apt-get install nodejs

# PostgreSQL
$ sudo apt-get install postgresql postgresql-contrib libpq-dev

# rugged
$ sudo apt-get install cmake pkg-config

# Yarn
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo -E apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt-get update && sudo apt-get install yarn
```

## Rails repository mirror

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
