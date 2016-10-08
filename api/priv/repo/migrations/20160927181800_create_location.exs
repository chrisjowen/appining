defmodule Appining.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :address1, :string
      add :address2, :string
      add :city, :string
      add :town, :string
      add :postcode, :string
      add :county, :string
      add :lat, :string
      add :long, :string
      add :position, :geography
      timestamps
    end
  end
end
