defmodule Bidding.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :brand, :string
      add :color, :string
      add :main_image_url, :string
      add :name, :string
      add :order, :integer
      add :price_kes, :integer
      add :released, :boolean, default: false, null: false
      add :sku, :string

      timestamps(type: :utc_datetime)
    end
  end
end
