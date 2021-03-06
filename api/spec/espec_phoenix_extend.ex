defmodule ESpec.Phoenix.Extend do
  def model do
    quote do
      alias Appining.Repo
    end
  end

  def controller do
    quote do
      alias Appining
      import Appining.Router.Helpers

      @endpoint Appining.Endpoint
    end
  end

  def view do
    quote do
      import Appining.Router.Helpers
    end
  end

  def channel do
    quote do
      alias Appining.Repo

      @endpoint Appining.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
