defmodule Appining.Scrapers.Meetup.MeetupClientSpec do
  use ESpec
  alias Appining.Scrapers.Meetup.MeetupClient

  context "Can retrieve meetup event search data", context_tag: :integration  do
    let :lat, do: 123
    let :long, do: 123
    let :radius, do: 123
    let :page, do: 1

    it "should parse correctly"  do
      result = MeetupClient.search(lat, long, radius, page)
      result |> should_not(eq nil)
    end
  end

end
