defmodule Bidding.Inventory.ItemAvailability do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_availabilities" do
    field :available_count, :integer
    field :item, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item_availability, attrs) do
    item_availability
    |> cast(attrs, [:available_count])
    |> validate_required([:available_count])
  end
end
