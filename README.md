# Incidences

This is a solution to this [challenge](https://buho.notion.site/Ejercicio-Ruby-on-Rails-incidences-82f04433896149e299c75c2522369dfc)

## Run

```bash
docker-compose up --build
```

Now the app should be running at `http://localhost:3000`

## Seed data

You can create random data to test by running:

```bash
docker-compose run web rails db:seed
```

## Test

```bash
docker-compose run web rspec
```
