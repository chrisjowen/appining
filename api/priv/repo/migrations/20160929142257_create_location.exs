defmodule Appining.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:location) do
      add :name, :string
      add :image, :string
      add :description, :string
      add :address1, :string
      add :address2, :string
      add :city, :string
      add :town, :string
      add :postcode, :string
      add :county, :string
      add :lat, :string
      add :long, :string

      timestamps
    end

  end
end
