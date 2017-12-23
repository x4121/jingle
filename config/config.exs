# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jingle,
  ecto_repos: [Jingle.Repo]

# Configures the endpoint
config :jingle, JingleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iEOoVmkW1fAaQ8oadM05U9qWAQ0XtDSGUuabhwBpskeyIepvuwAGrJ11RW6oA8ZI",
  render_errors: [view: JingleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Jingle.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
