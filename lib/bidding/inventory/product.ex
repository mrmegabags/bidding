defmodule Bidding.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :brand, :string
    field :color, :string
    field :main_image_url, :string
    field :name, :string
    field :order, :integer
    field :price_kes, :integer
    field :released, :boolean, default: false
    field :sku, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:brand, :color, :main_image_url, :name, :order, :price_kes, :released, :sku])
    |> validate_required([:brand, :color, :main_image_url, :name, :order, :price_kes, :released, :sku])
  end
end
