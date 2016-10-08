defmodule Appining.Scrapers.PersistWorker do
  alias Appining.Repo
  def perform(ning) do
    changeset = Appining.Ning.changeset(%Appining.Ning{}, ning)
    Repo.insert!(changeset)
    {:ok, :ack}
  end
end
