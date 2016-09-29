defmodule Appining.Scrapers.Eventful.Worker do
  alias Appining.Scrapers.Eventful.Client
  alias Appining.Scrapers.Eventful.ResponseParser
  require Logger

  def perform(lat, lng, radius, page) do
    case Client.search(lat, lng, radius, page) do
      %HTTPotion.Response{body: body} -> ResponseParser.parse(body) |> process_response(lat, lng, radius)
    end
    {:ok, :ack}
  end

  def process_response(response, lat, lng, radius) do
    meta = response.meta
    {page_number, _} = meta.page_number |> to_string |> Integer.parse
    {page_count, _} = meta.page_count |> to_string |> Integer.parse

    next_page = page_number + 1
    Logger.debug("processed page #{meta.page_number} of #{meta.page_size} then on to #{next_page}")

    titles = response.events |> Enum.map(fn event -> event[:title] end)
    Logger.debug("found events: #{inspect(titles)}")

    if(page_number != page_count) do
      Exq.enqueue(Exq, "default", __MODULE__, [lat, lng, radius, next_page])
    end
  end
end
