# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :request_ben,
  ecto_repos: [RequestBen.Repo]

# Configures the endpoint
config :request_ben, RequestBenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OVqmmWe55/AyMAy4e1kFMw2pucyWzo4njcFXM7uGQ5TUfvM0YXFuDCOMK/DPsVNU",
  render_errors: [view: RequestBenWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RequestBen.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
