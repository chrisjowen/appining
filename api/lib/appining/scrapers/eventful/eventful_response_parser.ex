defmodule Appining.Scrapers.Eventful.ResponseParser do
  import SweetXml

  def parse(document) do
    %{
      meta: parse_pagination_meta(document),
      events: parse_events(document)
    }
  end

  def parse_pagination_meta(document) do
    document |> xpath(~x"//search",
      total_items: ~x"./total_items/text()"s,
      page_size:  ~x"./page_size/text()"s,
      page_count:  ~x"./page_count/text()"s,
      page_number: ~x"./page_number/text()"s
    )
  end

  def parse_events(document) do
      document |> xpath(~x"//event"l,
        [
          title: ~x"./title/text()"s,
          url: ~x"./url/text()"s,
          description: ~x"./description/text()"s,
          start_time: ~x"./start_time/text()"s,
          stop_time: ~x"./stop_time/text()"s,
          image:  [
            ~x"./image/.",
            url: ~x"./url/text()"s,
            width: ~x"./width/text()"s,
            height: ~x"./height/text()"s,
          ],
          venue: [
            ~x".//..",
            url: ~x"./venue_url/text()"s,
            name: ~x"./venue_name/text()"s,
            display: ~x"./venue_display/text()"s,
            url: ~x"./venue_url/text()"s,
            address: [
              ~x".//..",
              first_line: ~x"./venue_address/text()"s,
              city: ~x"./city_name/text()"s,
              region: ~x"./region_name/text()"s,
              abbr: ~x"./region_abbr/text()"s,
              postal_code: ~x"./postal_code/text()"s,
              country: ~x"./country_name/text()"s,
              latitude: ~x"./latitude/text()"s,
              longitude: ~x"./longitude/text()"s
            ]
          ]
        ]

      )
  end

end
