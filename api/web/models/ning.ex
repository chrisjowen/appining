defmodule Appining.Ning do
  use Appining.Web, :model

  schema "ning" do
    field :title, :string
    field :starts_at, Ecto.DateTime
    field :ends_at, Ecto.DateTime
    field :description, :string
    field :how_to_find_us, :string
    field :img, :string
    field :source, :string
    field :url, :string
    has_one :location, Appining.Location

    timestamps
  end

  @required_fields ~w(title starts_at source)
  @optional_fields ~w(description img url ends_at how_to_find_us venue)

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
