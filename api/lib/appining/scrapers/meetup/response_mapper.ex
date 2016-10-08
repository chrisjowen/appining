defmodule Appining.Scrapers.Meetup.ResponseMapper do

  def map(%{"results" => results, "meta" => meta}) do
    results |> Enum.map(&map_result/1)
  end

  def map(_), do: raise("Unknown response type")

  defp map_result(result = %{"name" => name, "venue" => venue} ) do
    %{
      title: name,
      description: result |> Map.get("description", nil),
      img: nil,
      source: "MEETUP",
      location: map_location(venue)
    }
  end
  defp map_result(_), do: nil

  defp map_location(location = %{"lon" => lon, "lat" => lat}) do
      %{
        address1: location |> Map.get("address_1", nil),
        name: location |> Map.get("name", nil),
        city: location |> Map.get("city", nil),
        lat:  lat |> to_string,
        long: lon |> to_string
      }
  end

end
