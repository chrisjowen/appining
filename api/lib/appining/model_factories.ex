defmodule Appining.ModelFactory  do
  use ExMachina.Ecto, repo: Appining.Repo
  # # with Ecto
  #
  def location_factory do
    position = %Geo.Point{ coordinates: {Faker.Address.latitude, Faker.Address.longitude}, srid: nil}
    %Appining.Location{
       address1: Faker.Address.street_address,
       address2: Faker.Address.secondary_address,
       city: Faker.Address.city,
       town: Faker.Address.state,
       postcode: Faker.Address.state,
       county: Faker.Address.state,
       lat: Faker.Address.latitude |> to_string,
       long: Faker.Address.longitude  |> to_string,
       position: position
    }
  end

  def offer_factory do
    %Appining.Offer{
      title: Faker.Company.name,
      description: Faker.Lorem.paragraph,
      min_people: 1,
      starts_at: random_date,
      ends_at: random_date,
      resturant: build(:resturant)
    }
  end

  def cuisine_factory do
    %Appining.Cuisine{
      name: "Food",
      icon: ""
    }
  end

  def image_factory do
    %Appining.Image{
      url: "image_url"
    }
  end


  def resturant_factory do
    %Appining.Resturant{
      name: Faker.Company.name,
      description: Faker.Lorem.paragraph,
      location: build(:location),
      cuisines: [build(:cuisine)],
      images: [build(:image), build(:image)]
    }
  end

  def random_date do
    Ecto.DateTime.utc
  end
end
