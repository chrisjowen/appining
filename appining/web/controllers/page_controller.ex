defmodule Appining.PageController do
  use Appining.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
