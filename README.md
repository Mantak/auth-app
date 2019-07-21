# AuthApp

## Documentation

This is an example of application with authentication in Phoenix framework using Guardina package.

## Requirements

* Elixi (current version 1.6.6)
* Phoenix Framework (current version 1.4)
* PostgreSQL

## Getting Started

After cloning, first install dependencies:

`mix deps.get`

Change database configuration in `dev.exs` inside config directory and run migration:

`mix ecto.migrate`

Start the app by running:

`mix phx.server`
