# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth_app,
  ecto_repos: [AuthApp.Repo]

# Configures the endpoint
config :auth_app, AuthAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "58pdsyMJjfYGImPxS21RQ3mj7jzyLt/VXbJb9iD09ksz3pr3Uw81KTyLDIqqeLFF",
  render_errors: [view: AuthAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian Config
config :auth_app, AuthAppWeb.Services.Guardian,
  issuer: "auth_app",
  secret_key: "tkNpBihIvQOTbyyaYlELsu5LTpBkvSkQOUj1qbCWH4WBme6KEtSPMmgWR6XDT8oc"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
