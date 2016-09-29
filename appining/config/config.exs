# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :appining, Appining.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "appining_repo",
  username: "user",
  password: "password",
  hostname: "localhost"
#
# config :appining, Appining.Repo,
#   adapter: RethinkDB.Ecto
config :appining, ecto_repos: [Appining.Repo]

# Configures the endpoint
config :appining, Appining.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "XyqwPJC2h7F6Z+gU/bst+SczscZ/Z2D3G+lWv4KZo467dgvF0DacnW3Teq9lbj3k",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Appining.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Scrapers
config :appining, :eventful,
  base_url: "http://api.eventful.com/rest",
  key: "cswJCZqk4XMsBDsv"

config :mix_test_watch,
  tasks: [
    "espec"
  ]

config :exq,
  host: "127.0.0.1",
  port: 6379,
  namespace: "exq",
  concurrency: 1000,
  queues: ["default"]

config :exq_ui,
  webport: 4040,
  web_namespace: "",
  server: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
