defmodule Appining.NingController do
  use Appining.Web, :controller


  def create(conn,  %{"ning" => ning}) do
    Appining.Endpoint.broadcast("ning:events", "ning:created", ning)
    json conn, %{message: :ok}
    # render conn, "index.html"
  end

end
