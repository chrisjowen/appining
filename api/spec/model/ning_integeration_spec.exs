# defmodule Appining.Model.NingIntegrationSpec do
#   use ESpec
#   alias Appining.Scrapers.Eventful.ResponseParser
#   alias Appining.{Repo, Ning}
#   import Ecto.Query
#
#
#   context "Saving assosiated location position", context_tag: :integration   do
#     let :location_params, do: %{ "name" => "Valid location", "lat" => "1234", "long" => "4321"}
#     let :params, do: %{ "title" => "Some Ning", "source" => "happy days", "location" => location_params}
#
#     it "should save position if missing" do
#         changeset = Ning.changeset(%Ning{}, params)
#         result = Repo.insert!(changeset)
#     end
#   end
#
#   context "Saving without position", context_tag: :current  do
#     let :lat, do: 51.5074
#     let :long, do:  -1.548567
#     let :distance, do:  10
#     let :location_params, do: %{ "name" => "Valid location", "lat" => "#{lat}", "long" => "#{long}"}
#     let :params, do: %{ "title" => "Some Ning", "source" => "happy days", "location" => location_params}
#
#     before do
#       changeset = Ning.changeset(%Ning{}, params)
#       Repo.insert!(changeset)
#     end
#
#     it "should save position if missing" do
#       result = Ning.nearby(lat, long, distance) |> Ning.limit(10) |> Repo.all
#       expect(length(result)) |> to(be(1))
#       [ning, distance] = result |> List.first
#       expect(distance) |> to(be(0))
#     end
#   end
#
#
#   # def all, do: from l in Appining.Location, select: l
#   #
#   # def nearby(lat, long) do
#   #   point = Geo.WKT.decode("POINT(#{lat} #{long})")
#   #   from l in all,
#   #     select: st_distance(l.position, ^point), as: :distance,
#   #     order_by: :distance
#   # end
#
# end
