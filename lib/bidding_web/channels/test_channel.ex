defmodule BiddingWeb.TestChannel do
  use Phoenix.Channel
  # intercept ["request_ping"]

  def join("test:entry", _, socket) do
    {:ok, socket}
  end

  def handle_in("test_ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # def handle_out("request_ping", payload, socket) do
  #   push(socket, "send_ping", Map.put(payload, "from_node", Node.self()))
  #   {:noreply, socket}
  # end
end
