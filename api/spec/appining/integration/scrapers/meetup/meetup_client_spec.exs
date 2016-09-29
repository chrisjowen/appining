defmodule Appining.Scrapers.Meetup.MeetupClientSpec do
  use ESpec
  alias Appining.Scrapers.Meetup.Client

  context "Can retrieve meetup event search data", context_tag: :integration  do
    let :lat, do: 51.5074
    let :long, do: 0.1278
    let :radius, do: 10
    let :page, do: 1

    it "should parse correctly"  do
      result = Client.search(lat, long, radius, page)
      result.status_code |> should(eq 200)
      # IO.inspect(result.body)
    end
  end

end
