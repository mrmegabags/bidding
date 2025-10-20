defmodule BiddingWeb.PageController do
  use BiddingWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
