defmodule Bidding.Inventory.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :size, :string
    field :sku, :string
    belongs_to :product, Bidding.Inventory.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:size, :sku, :product_id])
    |> validate_required([:size, :sku, :product_id])
  end
end
