import Config
# alias SamiMetrics.Postgrex

# Configure your database
config :sami_metrics, SamiMetrics.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "sami_metrics_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  parameters: [
    {:application_name, "sami_metrics"}
  ]

# # Start the Postgrex connection
# {:ok, _} = SamiMetrics.Postgrex.start_link(
#   username: "postgres",
#   password: "123456",
#   hostname: "localhost",
#   database: "sami_metrics_dev",
#   pool_size: 10
# )
  # {:ok, conn} = Postgrex.start_link(db_opts)

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we can use it
# to bundle .js and .css sources.
config :sami_metrics, SamiMetricsWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4093],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "ignYLKZx93r2rFh9W6MiRDYBj9qFGAOZ1hw3Un+Fg7Nr8YJUkHA9BeSdUHM7IutV",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :sami_metrics, SamiMetricsWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/sami_metrics_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

# Enable dev routes for dashboard and mailbox
config :sami_metrics, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false
