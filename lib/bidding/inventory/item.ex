defmodule Bidding.Inventory.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :size, :string
    field :sku, :string
    field :product, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:size, :sku])
    |> validate_required([:size, :sku])
  end
end
