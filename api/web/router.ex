defmodule Appining.Router do
  use Appining.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

  end

  scope "/", Appining do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Appining do
    pipe_through :api

    post "/", NingController, :create
    get "/nearby/:lat/:long", NingController, :nearby
    get "/offer/nearby/:lat/:long", OfferController, :nearby
    get "/enqueue", NingController, :enqueue

  end

end
