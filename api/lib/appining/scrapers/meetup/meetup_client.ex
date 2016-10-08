defmodule Appining.Scrapers.Meetup.Client do
  @config Application.get_env(:appining, :meetup)

  use HTTPotion.Base
  alias Appining.Http
  alias Appining.Scrapers.Meetup.ResponseMapper

  def search(lat, long, radius), do: get([lat: lat, lon: long, radius: radius, key: @config[:key]] |>  Http.make_qs )
  def process_url(params), do: @config[:base_url] <> "/2/open_events.json?" <>  params
end
