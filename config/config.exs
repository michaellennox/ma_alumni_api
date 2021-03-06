# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ma_alumni_api,
  ecto_repos: [MaAlumniApi.Repo]

# Configures the endpoint
config :ma_alumni_api, MaAlumniApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DRyjeGHCfNUhbonWmhHJJf6walEek7sBMAnitseIRAi9Zg/hY5N/7WKnrBR7bbXB",
  render_errors: [view: MaAlumniApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: MaAlumniApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures json-api
config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
