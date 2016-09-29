defmodule Appining.Scrapers.Eventful.ResponseParserSpec do
  use ESpec
  alias Appining.Scrapers.Eventful.ResponseParser


  context "Valid xml parsing" do
    let :document, do: File.stream!("spec/resources/eventful_response.xml")
    subject do: ResponseParser.parse(document)

    it "should parse correctly" do
        IO.inspect(subject)
    end
  end

end
