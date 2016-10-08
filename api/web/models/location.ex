defmodule Appining.Location do
  use Appining.Web, :model
  import Ecto.Query
  import Geo.PostGIS

  schema "locations" do
    field :address1, :string
    field :address2, :string
    field :city, :string
    field :town, :string
    field :postcode, :string
    field :county, :string
    field :lat, :string
    field :long, :string
    field :position, Geo.Point
    timestamps
  end

  @required_fields ~w(lat long position)
  @optional_fields ~w(address2 town county address1 city postcode)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  # def changeset(model, params = %{lat: lat, long: long}), do: changeset(model, add_coordinates(params, lat, long))
  def changeset(model, params \\ :empty) do
    model |> cast(add_coordinates(params), @required_fields, @optional_fields)
  end

  # def all, do: from l in Appining.Location, select: l
  #
  # def nearby(lat, long) do
  #   point = Geo.WKT.decode("POINT(#{lat} #{long})")
  #   from l in all,
  #     select: st_distance(l.position, ^point), as: :distance,
  #     order_by: :distance
  # end


  defp add_coordinates(%{lat: lat, long: long}), do: add_coordinates(%{"lat" => lat, "long" => long})
  defp add_coordinates(params = %{"lat" => lat, "long" => long}) do
    {lat, _} = Float.parse(lat)
    {long, _} = Float.parse(long)
    position =  %Geo.Point{ coordinates: {lat, long}, srid: nil}
    Map.put(params, "position", position)
  end

  defp add_coordinates(it), do:     IO.inspect(it)


end
