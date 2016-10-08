defmodule Appining.Model.ResturantIntegrationSpec do
  use ESpec
  alias Appining.Scrapers.Eventful.ResponseParser
  alias Appining.{Repo, Resturant}


  context "Resturant", context_tag: :integrations  do
    subject do: Appining.ModelFactory.insert(:resturant, %{cuisines: [], images: []})

    it "should save location" do
        expect(subject.location) |> to_not(be(nil))
    end

    context "adding images", context_tag: :integration do
      let :image, do: Appining.ModelFactory.insert(:image)

      it "should save assosiated image" do
        subject = subject |> Repo.preload(:images)
        changeset = Ecto.Changeset.change(subject) |> Ecto.Changeset.put_assoc(:images, [image])
        resturant = Repo.update!(changeset) |> Repo.preload(:images)
        expect(resturant.images |> length) |> to(be(1))
      end
    end

    context "adding categories", context_tag: :integration do
      let :cuisine, do: Appining.ModelFactory.insert(:cuisine)

      it "should save assosiated category" do
        subject = subject |> Repo.preload(:cuisines)
        changeset = Ecto.Changeset.change(subject) |> Ecto.Changeset.put_assoc(:cuisines, [cuisine])
        resturant = Repo.update!(changeset) |> Repo.preload(:cuisines)
        expect(resturant.cuisines |> length) |> to(be(1))
      end
    end
  end
end
