defmodule SamiMetricsWeb.DBConnectionListener do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def get_notifications(pid) do
    GenServer.call(pid, :read_state)
  end

  @impl true
  def init(stack) when is_list(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:read_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_info({:connected, _pid} = msg, state) do
    {:noreply, [msg | state]}
  end

  @impl true
  def handle_info({_other_states, _pid} = msg, state) do
    {:noreply, [msg | state]}
  end
end
