defmodule Appining.Model.LocationIntegrationSpec do
  use ESpec
  alias Appining.Scrapers.Eventful.ResponseParser
  alias Appining.{Repo, Location}

  context "Saving without position", context_tag: :integration  do
    let :params, do: %{ "name" => "Valid location", "lat" => "1234", "long" => "4321"}

    it "should save position if missing" do
        changeset = Location.changeset(%Location{}, params)
        result = Repo.insert!(changeset)
        expect(result.position) |> to_not(be(nil))
        %Geo.Point{coordinates: {lat, lng}} = result.position
        expect(lat) |> to(eq(1234.0))
        expect(lng) |> to(eq(4321.0))
    end
  end

end
