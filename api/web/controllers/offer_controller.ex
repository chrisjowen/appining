defmodule Appining.OfferController do
  use Appining.Web, :controller
  import Ecto.Query
  alias Appining.Offer
  alias Appining.Repo

  def nearby(conn, req = %{"lat" => lat, "long" => long}) do
    {distance, _} = (req["distance"] || 1) |> Float.parse
    page = req["page"] || 1
    locations =  Offer.nearby(lat, long, distance) |> Repo.paginate(page: page, page_size: 20)
    json conn, locations
  end

end
