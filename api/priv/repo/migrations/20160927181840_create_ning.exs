defmodule Appining.Repo.Migrations.CreateNing do
  use Ecto.Migration

  def change do
    create table(:ning) do
      add :title, :string
      add :starts_at, :datetime
      add :ends_at, :datetime
      add :description, :string
      add :img, :string
      add :source, :string
      add :url, :string
      add :how_to_find_us, :string
      add :venue_id, :integer
      timestamps
    end

  end
end
