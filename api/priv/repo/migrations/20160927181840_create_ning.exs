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
      timestamps
    end

  end
end
