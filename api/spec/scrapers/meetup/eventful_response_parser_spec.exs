defmodule Appining.Scrapers.Meetup.ResponseMapperSpec do
  use ESpec
  alias Appining.Scrapers.Meetup.ResponseMapper

  context "Valid JSON", context_tag: :unit  do
    let :response, do: File.read!("spec/resources/meetup_response.json") |> Poison.decode!
    let :result,  do: ResponseMapper.map(response)
    let :event,  do:  result |> List.first

    it "should have single response", do: result |> length |> should(be(1))
    it "should map name", do: event.title |> should(be("NAME"))
    it "should map description", do: event.description |> should(be("DESCRIPTION"))
    it "should map source", do: event.source |> should(be("MEETUP"))

    context "Location" do
      let :location, do: event.location

      it "should map location address1", do: location.address1 |> should(be("ADDRESS1"))
      it "should map location name", do: location.name |> should(be("NAME"))
      it "should map location city", do: location.city |> should(be("CITY"))
      it "should map location lat", do: location.lat |> should(be("2"))
      it "should map location long", do: location.long |> should(be("1"))

      # How to do Ecto datetime
      # subject.starts_at |> should(be("MEETUP")) 1475154000000

    end

  end

end
