defmodule Appining.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :url, :string
      timestamps
    end

  end
end
