defmodule Appining.Repo.Migrations.CreateOffer do
  use Ecto.Migration

  def change do
    create table(:offers) do
      add :title, :string
      add :description, :text
      add :min_people, :integer
      add :starts_at, :datetime
      add :ends_at, :datetime
      add :resturant_id, references(:resturants)
      timestamps
    end

  end
end
