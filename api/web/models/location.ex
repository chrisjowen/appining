defmodule Appining.Location do
  use Appining.Web, :model

  schema "location" do
    field :name, :string
    field :image, :string
    field :description, :string
    field :address1, :string
    field :address2, :string
    field :city, :string
    field :town, :string
    field :postcode, :string
    field :county, :string
    field :lat, :string
    field :long, :string

    timestamps
  end

  @required_fields ~w(name lat long)
  @optional_fields ~w(description address2 town county address1 city postcode)

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
