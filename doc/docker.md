# Development with Docker

## Boot containers

```
$ docker-compose up -d --build
```

## Application setup

```
$ docker-compose exec app bin/setup
```

## Developing locally

To populate an empty database:

```
$ docker-compose exec app rails runner Repo.sync
```

If you modify the name mappings, hard-coded authors, etc., that task also
updates the credits and it does so changing as little as possible.

Sometimes you may need to rebuild the assignments, for example if the actual
heuristics change. To do that please execute

```
$ docker-compose exec app rails runner "Repo.sync(rebuild_all: true)"
```

## Test suite

To run the test suite execute

```
$ docker-compose exec app rails test
```

## Resume containers

```
$ docker-compose down
```
