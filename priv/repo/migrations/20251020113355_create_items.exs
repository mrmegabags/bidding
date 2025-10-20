defmodule Bidding.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :size, :string
      add :sku, :string
      add :product, references(:products, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:items, [:product])
  end
end
