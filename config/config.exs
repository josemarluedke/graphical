# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphical,
  ecto_repos: [Graphical.Repo]

# Configures the endpoint
config :graphical, GraphicalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uMwnmJEjRezlYKLWPXH82ZSp6flzigDA4umtA95TGUqbMOdsTqNAaSiVMB1fXHcE",
  render_errors: [view: GraphicalWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Graphical.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :graphical, Graphical.Guardian,
  issuer: "graphical",
  secret_key: "qFxuD/eSBiki+8mU7jZp/1H44NF4RLOLswRcWK5VFd7FCtQNPtSUnvPpd4AxfJkj"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
