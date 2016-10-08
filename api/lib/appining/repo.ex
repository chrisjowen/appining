defmodule Appining.Repo do
  use Ecto.Repo, otp_app: :appining
  use Scrivener, page_size: 10
end
