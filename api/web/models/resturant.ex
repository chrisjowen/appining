defmodule Appining.Resturant do
  use Appining.Web, :model

  schema "resturants" do
    field :name, :string
    field :description, :string
    belongs_to :location, Appining.Location
    many_to_many :cuisines, Appining.Cuisine, join_through: "resturant_cuisine"
    many_to_many :images, Appining.Image, join_through: "resturant_images"
    timestamps
  end

  @required_fields ~w(name description)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)

  end
end
