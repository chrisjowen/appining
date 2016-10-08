defmodule Appining.Repo.Migrations.CreateResturant do
  use Ecto.Migration

  def change do
    create table(:resturants) do
      add :location_id, references(:locations)
      add :name, :string
      add :description, :text
      timestamps
    end

  end
end
