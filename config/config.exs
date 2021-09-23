# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :haha,
  ecto_repos: [Haha.Repo]

# Configures the endpoint
config :haha, HahaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "575Yf+5Dq6ritsOa9UKoY5NeywhgNBfFNshYOhdFZOJJ2+kDVokWsgyF9UHvKfio",
  render_errors: [view: HahaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Haha.PubSub,
  live_view: [signing_salt: "pEUup6Xx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Ueberauth
config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [opt1: "value", opts2: "value"]}
  ]

# Configures Ueberauth-Github
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "be1a7b1eb80129c5b287",
  client_secret: "2beba5ba93bddfedd3d2e43d2a000dfec2401b2e"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
