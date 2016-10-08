defmodule Appining.Http do
  import Logger

  def make_qs(params) do
    params
      |> Enum.map(fn({key, value}) -> "#{key}=#{value}" end)
      |> Enum.join("&")
  end

end
