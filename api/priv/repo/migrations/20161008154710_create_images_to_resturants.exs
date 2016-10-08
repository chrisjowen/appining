defmodule Appining.Repo.Migrations.CreateImagesToResturants do
  use Ecto.Migration

  def change do
    create table(:resturant_images) do
       add :resturant_id, references(:resturants, on_delete: :delete_all)
       add :image_id, references(:images, on_delete: :delete_all)
     end
  end
end
