# Rails Contributors

[![CircleCI](https://circleci.com/gh/rails/rails-contributors.svg?style=svg)](https://circleci.com/gh/rails/rails-contributors)

This is the application behind https://contributors.rubyonrails.org.

## Notes

```
curl 'https://github.com/rails/rails/graphs/contributors-data' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0) Gecko/20100101 Firefox/91.0' -H 'Accept: application/json' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://github.com/rails/rails/graphs/contributors?from=2015-07-07&to=2016-08-14&type=c' -H 'X-Requested-With: XMLHttpRequest' -H 'DNT: 1' -H 'Connection: keep-alive'
```

^^ We can use this to get the contributors contributions by week

## Documentation

* [*doc/fix_credit.md*](doc/fix_credit.md) explains how to fix credits.
* [*doc/docker.md*](doc/docker.md) covers development with Docker.
* [*doc/design.md*](doc/design.md) documents the design of the application.
* [*doc/production.md*](doc/production.md) notes for production servers.

## License

Released under the MIT License, Copyright (c) 2012–<i>ω</i> Xavier Noria.
