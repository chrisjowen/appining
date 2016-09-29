defmodule Appining.Ning do
  use Appining.Web, :model

  schema "ning" do
    field :title, :string
    field :starts_at, Ecto.DateTime
    field :ends_at, Ecto.DateTime
    field :description, :string
    field :img, :string
    field :source, :string
    timestamps
  end

  @required_fields ~w(title starts_at ends_at source)
  @optional_fields ~w(description img)

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
