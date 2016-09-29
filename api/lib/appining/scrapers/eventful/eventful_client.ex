defmodule Appining.Scrapers.Eventful.Client do
  use HTTPotion.Base
  import SweetXml

  @config Application.get_env(:appining, :eventful)

  def search(lat, lng, radius, page) do
     get(make_qs([where: "#{lat},#{lng}", page_number: page, page_size: 50]))
  end

  def process_url(qs), do: @config[:base_url] <> "/events/search?" <> qs

  defp make_qs(params) do
    [app_key: @config[:key]] ++ params
      |> Enum.map(fn({key, value}) -> "#{key}=#{value}" end)
      |> Enum.join("&")
  end

end
