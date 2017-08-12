# Rails Contributors

This is the application behind http://contributors.rubyonrails.org.

## Ruby

Needs Ruby 2.4.1.

## System dependencies

PostgreSQL, and rugged dependencies.

In Ubuntu:

```
# PostgreSQL
sudo apt-get install postgresql postgresql-contrib libpq-dev

# rugged dependencies
sudo apt-get install cmake
```

## How to run the tests

Use the setup script to configure your application to be able to run the tests:

```
bin/setup
```

After this you can use the Rails rake tasks:

```
bin/rails test
```

## License

Released under the MIT License, Copyright (c) 2012–<i>ω</i> Xavier Noria.
