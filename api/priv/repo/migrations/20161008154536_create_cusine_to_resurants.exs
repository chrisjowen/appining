defmodule Appining.Repo.Migrations.CreateCusineToResurants do
  use Ecto.Migration

  def change do
    create table(:resturant_cuisine) do
       add :resturant_id, references(:resturants, on_delete: :delete_all)
       add :cuisine_id, references(:cuisines, on_delete: :delete_all) 
     end
  end
end
