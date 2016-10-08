defmodule Appining.Ning do
  use Appining.Web, :model
  import Ecto.Query
  import Geo.PostGIS

  schema "ning" do
    field :title, :string
    field :starts_at, Ecto.DateTime
    field :ends_at, Ecto.DateTime
    field :description, :string
    field :how_to_find_us, :string
    field :img, :string
    field :source, :string
    field :url, :string
    belongs_to :location, Appining.Location
    timestamps
  end

  @required_fields ~w(title source)
  @optional_fields ~w(starts_at img url ends_at how_to_find_us)

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
    point = Geo.WKT.decode("POINT(#{lat} #{long})")
    from n in Appining.Ning,
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
