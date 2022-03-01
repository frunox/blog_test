# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :blog_test,
  ecto_repos: [BlogTest.Repo]

# Configures the endpoint
config :blog_test, BlogTestWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: BlogTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BlogTest.PubSub,
  live_view: [signing_salt: "wjrwnRAj"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :blog_test, BlogTest.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :blog_test, :pow,
  user: BlogTest.Users.User,
  repo: BlogTest.Repo,
  web_module: BlogTestWeb,
  extensions: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: BlogTestWeb.PowMailer,
  messages_backend: BlogTestWeb.Pow.Messages,
  routes_backend: BlogTestWeb.Pow.Routes

config :blog_test, :pow_assent,
  providers: [
    github: [
      client_id: "a49215643510af4c3f9e",
      client_secret: "99c00cbed7e49a06e207265d8560925da8b4aa3f",
      strategy: Assent.Strategy.Github
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
