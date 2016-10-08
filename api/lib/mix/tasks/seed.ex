defmodule Mix.Tasks.Seed do
  use Mix.Task

  import Mix.Ecto
  import Ecto.Query
  alias Appining.Repo
  alias Appining.Location

  def run(_) do
    start_link
    0..100 |> Enum.each(fn _ -> build() end)
  end

  def build do
    Appining.ModelFactory.insert(:offer)
  end

  def start_link do
    {:ok, _} = Application.ensure_all_started(:postgrex)
    {:ok, _} = Application.ensure_all_started(:ex_machina)
    {:ok, _} = Application.ensure_all_started(:faker)
    Repo.start_link
    ensure_started(Repo, [])
  end

end
