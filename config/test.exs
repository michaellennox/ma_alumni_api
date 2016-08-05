use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ma_alumni_api, MaAlumniApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ma_alumni_api, MaAlumniApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ma_alumni_api_test",
  hostname: "api_db",
  pool: Ecto.Adapters.SQL.Sandbox
