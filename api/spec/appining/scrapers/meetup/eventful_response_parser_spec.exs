defmodule Appining.Scrapers.Meetup.ResponseMapperSpec do
  use ESpec
  alias Appining.Scrapers.Meetup.ResponseMapper

  context "Valid JSON", context_tag: :unit  do
    let :response, do: File.stream!("spec/resources/meetup_response.json") |> Poison.encode!
    subject do: ResponseMapper.map(response)
    
    it "should single venue response" do
        subject.title |> should(be("TITLE"))
        subject.description |> should(be("DESCRIPTION"))
        subject.image |> should(be(nil))
        subject.source |> should(be("MEETUP"))

        location = subject.location
        location.address1 |> should(be("ADDRESS1"))
        location.name |> should(be("NAME"))
        location.city |> should(be("CITY"))
        location.lat |> should(be(1))
        location.long |> should(be(2))
        # How to do Ecto datetime
        # subject.starts_at |> should(be("MEETUP")) 1475154000000
    end


  end

end
