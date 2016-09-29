defmodule Appining.Scrapers.Eventful.Client do
  use HTTPotion.Base
  import SweetXml

  @config Application.get_env(:appining, :eventful)

  def search(lat, lng, radius, page) do
     get(make_qs([where: "#{lat},#{lng}", page_number: page, page_size: 50]))
  end

  def process_url(qs) do
    url = @config[:base_url] <> "/events/search?" <> qs
    IO.inspect(url)
    url
  end

  def process_response_body(body) do
    body
  end

  defp make_qs(params) do
    IO.inspect(params)
    [app_key: @config[:key]] ++ params
      |> Enum.map(fn({key, value}) -> "#{key}=#{value}" end)
      |> Enum.join("&")
  end

end
