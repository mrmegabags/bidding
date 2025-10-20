defmodule Bidding.Repo.Migrations.CreateItemAvailabilities do
  use Ecto.Migration

  def change do
    create table(:item_availabilities) do
      add :available_count, :integer
      add :item, references(:items, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:item_availabilities, [:item])
  end
end
