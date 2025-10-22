defmodule BiddingWeb.TestSocket do
  use Phoenix.Socket

  channel "test:*", BiddingWeb.TestChannel

  def connect(_, socket, _) do
    {:ok, socket}
  end

  def id(_) do
    nil
  end
end
