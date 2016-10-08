defmodule Appining.Repo.Migrations.CreateCuisine do
  use Ecto.Migration

  def change do
    create table(:cuisines) do
      add :name, :string
      add :icon, :string
      timestamps
    end

  end
end
