defimpl Poison.Encoder, for: Appining.Ning do
  @attributes [:id, :title, :starts_at, :ends_at, :description,
               :how_to_find_us, :img, :source, :url, :location]


  def encode(model, _options) do
    model |> Map.take(@attributes) |> Poison.encode!
  end
end

defimpl Poison.Encoder, for: Appining.Location do
  @attributes [:id, :name, :image, :description, :address1, :address2,
               :city, :town, :postcode, :county, :lat, :long]

  def encode(model, _options) do
    model |> Map.take(@attributes) |> Poison.encode!
  end
end


defimpl Poison.Encoder, for: Appining.Offer do
  @attributes [:title, :description, :min_people, :starts_at, :ends_at]

  def encode(model, _options) do
    model |> Map.take(@attributes) |> Poison.encode!
  end
end



defimpl Poison.Encoder, for: Scrivener.Page do
  @attributes [:page_number, :page_size, :total_entries, :total_pages]

  def encode(model, _options) do
    model |> Map.take(@attributes) |> Map.put(:data, model.entries) |>  Poison.encode!
  end
end
