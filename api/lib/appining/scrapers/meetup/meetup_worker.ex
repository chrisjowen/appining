defmodule Appining.Scrapers.Meetup.Worker do
  alias Appining.Scrapers.Meetup.ResponseMapper
  alias Appining.Scrapers.Meetup.Client
  alias Appining.Scrapers.PersistWorker

  def perform(lat, long, radius) do
    case Client.search(lat, long, radius) do
       %HTTPotion.Response{body: body} ->
         body |> Poison.decode! |> ResponseMapper.map |> Enum.filter(fn (it) -> it != nil end) |> Enum.map(&queue_persist/1)
    end
    {:ok, :ack}
  end

  def queue_persist(ning), do: Exq.enqueue(Exq, "default", PersistWorker, [ning])

end
