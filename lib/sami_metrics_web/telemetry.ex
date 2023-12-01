defmodule SamiMetricsWeb.Telemetry do
  use Supervisor
  import Telemetry.Metrics
  # require Logger
  # import Telemetry.Metrics.Measurement

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      # Telemetry poller will execute the given period measurements
      # every 10_000ms. Learn more here: https://hexdocs.pm/telemetry_metrics
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000},
      # Add reporters as children of your supervision tree.
      # {Telemetry.Metrics.ConsoleReporter, metrics: metrics()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  # def handle_event([:sami_metrics, :repo, :query], measurements, metadata, config) do
  #   connection_metrics(measurements, metadata, config)
  # end

  # def connection_metrics(_measurements, _metadata, _config) do
  #   # Assuming you have a method to retrieve the number of connections from your Repo
  #   {:ok, connections} = SamiMetrics.Repo.extract(:connections)

  #   # Specify the count (you can make it dynamic based on your logic)
  #   count = 1

  #   # Report the metric to Telemetry
  #   SamiMetricsWeb.MetricsManager.increment("sami_metrics.repo.connections", connections, count)

  #   # Call :telemetry.execute/3 to complete the periodic measurement with the specified count
  #   :telemetry.execute([__MODULE__, :connection_metrics, []], self(), %{count: count})

  #   :ok
  # end
  # defp connection_metrics([]) do
  #   Logger.info("Empty measurements in connection_metrics/1")
  #   :ok
  # end

  # defp connection_metrics(measurements) do

  #   IO.inspect(measurements, label: "Measurements before case")
  #   case measurements do
  #     [%{idle_time: idle_time, decode_time: decode_time, queue_time: queue_time, query_time: query_time, total_time: total_time} | _rest] ->
  #       {repo, _} = measurements[0]

  #       pool_size_counter = Telemetry.Metrics.counter(:db_connection, repo, :pool_size)
  #       queue_size_counter = Telemetry.Metrics.counter(:db_connection, repo, :queue_size)
  #       checked_out_counter = Telemetry.Metrics.counter(:db_connection, repo, :checked_out)

  #       count_pool_size = Telemetry.Metrics.Counter.count(pool_size_counter) || 0
  #       count_queue_size = Telemetry.Metrics.Counter.count(queue_size_counter) || 0
  #       count_checked_out = Telemetry.Metrics.Counter.count(checked_out_counter) || 0

  #       Logger.debug("DB Connection Metrics - Repo: #{repo}, Pool Size: #{count_pool_size}, Queue Size: #{count_queue_size}, Checked Out: #{count_checked_out}")

  #       :ok

  #     _ ->
  #       Logger.warn("Empty or invalid measurements in connection_metrics/1")
  #       :error
  #   end
  # end


  # def handle_event([:sami_metrics, :repo, :query], measurements, _metadata, _config) do
  #   connection_metrics(measurements)
  # end


  def handle_event([:sami_metrics, :repo, :query], measurements, metadata, config) do
    IO.inspect binding()
  end


  def metrics do
    [
      # Phoenix Metrics
      summary("phoenix.endpoint.start.system_time",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.endpoint.stop.duration",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.router_dispatch.start.system_time",
        tags: [:route],
        unit: {:native, :millisecond}
      ),
      summary("phoenix.router_dispatch.exception.duration",
        tags: [:route],
        unit: {:native, :millisecond}
      ),
      summary("phoenix.router_dispatch.stop.duration",
        tags: [:route],
        unit: {:native, :millisecond}
      ),
      summary("phoenix.socket_connected.duration",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.channel_joined.duration",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.channel_handled_in.duration",
        tags: [:event],
        unit: {:native, :millisecond}
      ),

      # Database Metrics
      summary("sami_metrics.repo.query.total_time",
        unit: {:native, :millisecond},
        description: "The sum of the other measurements"
      ),
      summary("sami_metrics.repo.query.decode_time",
        unit: {:native, :millisecond},
        description: "The time spent decoding the data received from the database"
      ),
      summary("sami_metrics.repo.query.query_time",
        unit: {:native, :millisecond},
        description: "The time spent executing the query"
      ),
      summary("sami_metrics.repo.query.queue_time",
        unit: {:native, :millisecond},
        description: "The time spent waiting for a database connection"
      ),
      summary("sami_metrics.repo.query.idle_time",
        unit: {:native, :millisecond},
        description:
          "The time the connection spent waiting before being checked out for the query"
      ),

      # VM Metrics
      summary("vm.memory.total", unit: {:byte, :kilobyte}),
      summary("vm.total_run_queue_lengths.total"),
      summary("vm.total_run_queue_lengths.cpu"),
      summary("vm.total_run_queue_lengths.io")

      # Add a metric for the number of database connections
      # summary("sami_metrics.repo.connections", unit: :count, description: "Number of database connections"),
      # counter("sami_metrics.repo.connections.count")
      # counter("sami_metrics.repo.pool_size.count"),
      # counter("sami_metrics.repo.queue_size.count"),
      # counter("sami_metrics.repo.checked_out.count")
    ]
  end

  defp periodic_measurements do
    [
      # A module, function and arguments to be invoked periodically.
      # This function must call :telemetry.execute/3 and a metric must be added above.
      # {SamiMetricsWeb, :count_users, []}
      # {SamiMetrics, :connection_metrics, []}

    ]
  end
end
