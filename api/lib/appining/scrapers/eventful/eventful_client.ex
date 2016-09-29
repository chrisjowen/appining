defmodule Appining.Scrapers.Eventful.Client do
  use HTTPotion.Base
  import SweetXml

  alias Appining.Http

  @config Application.get_env(:appining, :eventful)

  def search(lat, lng, radius, page) do
     get([where: "#{lat},#{lng}", page_number: page, page_size: 50, app_key: @config[:key]] )
  end

  def process_url(params), do: @config[:base_url] <> "/events/search?" <> Http.make_qs(params)

end
