defmodule RumblWeb.ClockLive do
  use RumblWeb, :live_view
  import Calendar

  def render(assigns) do
    ~L"""
    <div>
      <h2>Date:  <%= strftime(@date, "%d-%m-%Y" ) %></h2>
      <h2>Time:  <%= strftime(@time, "%X" ) %></h2>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
    {:ok, put_datetime(socket)}
  end

  defp put_datetime(socket) do
    assign(socket, date: Date.utc_today(), time: Time.utc_now())
  end

  def handle_info(:tick, socket) do
    {:noreply, put_datetime(socket)}
  end
end
