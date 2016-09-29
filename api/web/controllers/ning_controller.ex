defmodule Appining.NingController do
  use Appining.Web, :controller
  alias Appining.Ning
  alias Appining.Scrapers.Eventful.Worker

  def create(conn, %{"ning" => ning}) do
    Appining.Endpoint.broadcast("ning:events", "ning:created", ning)
    json conn, %{message: :ok}
  end

  def nearby(conn, %{"lat" => lat, "long" => long}) do
    # Exq.enqueue(Exq, "default", Worker, [1,2,30,1])
    json conn, %{ data: [
      %{ id: 1, title: "Fabric Happy Hour", description: "Come down and see the crazy monsters", img: "http://www.ukstudentlife.com/Life/Entertainment/Clubbing/Clubbing3.jpg"},
      %{ id: 2, title: "Fabric Happy Hour", description: "Come down and see the crazy monsters", img: "http://www.ukstudentlife.com/Life/Entertainment/Clubbing/Clubbing3.jpg"},
      %{ id: 3, title: "Fabric Happy Hour", description: "Come down and see the crazy monsters", img: "http://www.ukstudentlife.com/Life/Entertainment/Clubbing/Clubbing3.jpg"},
      %{ id: 4, title: "Fabric Happy Hour", description: "Come down and see the crazy monsters", img: "http://www.ukstudentlife.com/Life/Entertainment/Clubbing/Clubbing3.jpg"},
      %{ id: 5, title: "Fabric Happy Hour", description: "Come down and see the crazy monsters", img: "http://www.ukstudentlife.com/Life/Entertainment/Clubbing/Clubbing3.jpg"},
    ]}
  end

end
