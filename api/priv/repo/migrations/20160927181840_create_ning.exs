defmodule Appining.Repo.Migrations.CreateNing do
  use Ecto.Migration

  def change do
    create table(:nings) do
      add :title, :string
      add :starts_at, :datetime
      add :ends_at, :datetime
      add :description, :text
      add :img, :string
      add :source, :string
      add :url, :string
      add :how_to_find_us, :string
      add :location_id, references(:locations)
      timestamps
    end

  end
end
