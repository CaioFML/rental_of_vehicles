# README

## Setup

Follow the steps below to run this application:

- Run docker image build:

  `docker-compose build`

- Put the server on, this will also create database, run migrations and generate seeds:

  `docker-compose up`

- Access by the browser with:

  `localhost:3000`

*To access protected area, just log with: `login: admin@example.com` and `password: 123456`

## Routes

- `/` - Will redirect to the root, where you can rent a car.
- `/vehicles` - Protected area, here you can see all cars to be rent.
- `/vehicles/new` - Protected area, form to add new car to rent.
- `/bookings` - Protected area, here will index all rents made by users.

## Running tests

- Rode o comando abaixo para executar os testes, que será gerado no formato de documentação e de forma aleatória:

  `docker-compose run --rm app bundle exec rspec`

## Running rubocop:

- That application was made using [rubocop](https://github.com/rubocop-hq/rubocop), this is a linter with styles proposed by [RubyStyle Guide](https://rubystyle.guide/)

  `docker-compose run --rm app bundle exec rubocop`

## References

- [betterspec](https://www.betterspecs.org/) was used as a best practice reference in creating the tests.