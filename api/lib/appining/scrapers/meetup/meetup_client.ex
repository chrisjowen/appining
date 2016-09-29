defmodule Appining.Scrapers.Meetup.Client do
  use HTTPotion.Base

  alias Appining.Http

  @config Application.get_env(:appining, :meetup)

  def search(lat, long, radius, page) do

     get([lat: lat, lon: long, radius: radius, key: @config[:key]] |>  Http.make_qs )
  end

  def process_url(params) do
    url = @config[:base_url] <> "/2/open_events.json?" <>  params
    IO.inspect(url)
    url
  end

end
