defmodule Bidding.Repo do
  use Ecto.Repo,
    otp_app: :bidding,
    adapter: Ecto.Adapters.Postgres
end
