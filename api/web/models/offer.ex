defmodule Appining.Offer do
  use Appining.Web, :model
  import Geo.PostGIS

  schema "offers" do
    field :title, :string
    field :description, :string
    field :min_people, :integer
    field :starts_at, Ecto.DateTime
    field :ends_at, Ecto.DateTime
    belongs_to :resturant, Appining.Resturant
    timestamps
  end

  @required_fields ~w(title description min_people starts_at ends_at location_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
      |> cast(params, @required_fields, @optional_fields)
      |> cast_assoc(:location, required: true)
  end

  def nearby(lat, long, distance) do
    distance = (distance/0.62137) * 1000

    point = Geo.WKT.decode("POINT(#{lat} #{long})")
    from n in Appining.Offer,
      join: l in assoc(n, :location),
      select: [n, st_distance(l.position, ^point)],
      preload: [location: l],
      order_by: st_distance(l.position, ^point),
      where: st_distance(l.position, ^point) < ^distance
  end

  def limit(query, limit) do
    from n in query, limit: ^limit
  end

end
