use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :appining, Appining.Endpoint,
  http: [port: 4001],
  server: false

config :appining, Appining.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "appining_test",
  username: "user",
  password: "password",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox


# Print only warnings and errors during test
config :logger, level: :warn
