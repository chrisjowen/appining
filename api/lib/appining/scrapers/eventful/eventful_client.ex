defmodule Appining.Scrapers.Eventful.Client do
  @config Application.get_env(:appining, :eventful)

  use HTTPotion.Base
  import SweetXml
  alias Appining.Http
  require Logger


  def search(lat, lng, radius, page), do: get([
      location: "#{lat},#{lng}",
      page_number: page,
      within: radius,
      include: "categories,subcategories",
      app_key: @config[:key]
    ] |>  Http.make_qs , [timeout: 20000])
  def process_url(params), do: debug(@config[:base_url] <> "/events/search?" <> params)

  def debug(it) do
    Logger.debug(it)
    it
  end

end
