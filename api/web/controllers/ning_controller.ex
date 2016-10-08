defmodule Appining.NingController do
  use Appining.Web, :controller
  import Ecto.Query

  alias Appining.Ning
  alias Appining.Scrapers.{Meetup, Eventful}
  alias Appining.Repo

  def create(conn, %{"ning" => ning}) do
    Appining.Endpoint.broadcast("ning:events", "ning:created", ning)
    json conn, %{message: :ok}
  end

  def nearby(conn, req = %{"lat" => lat, "long" => long}) do
    {distance, _} = (req["distance"] || 10) |> Float.parse
    page = req["page"] || 1
    locations =  Ning.nearby(lat, long, distance) |> Repo.paginate(page: page, page_size: 20)
    json conn, locations
  end

  def enqueue(conn, _) do
    lat = 53.801277
    long =  -1.548567

    r = 10
    Exq.enqueue(Exq, "default", Eventful.Worker, [lat,long,r, 1])
    # Exq.enqueue(Exq, "default", Meetup.Worker, [lat,long,r])
    json conn, :ok
  end


end
