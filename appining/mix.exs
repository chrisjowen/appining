defmodule Appining.Mixfile do
  use Mix.Project

  def project do
    [app: :appining,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [espec: :test],
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Appining, []},
     applications: [
       :phoenix,
       :phoenix_html,
       :cowboy,
       :logger,
       :gettext,
       :ecto,
       :httpotion,
       :postgrex,
       :tzdata,
       :exq
      #  :rethinkdb_ecto
       ]
     ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.1.3"},
     {:phoenix_html, "~> 2.3"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.9"},
     {:cors_plug, "~> 1.1"},
     {:cowboy, "~> 1.0"},
     {:ecto, "~> 2.0"},
     {:postgrex, "~> 0.11"},
     {:poison, "~> 2.0"},
     {:httpotion, "~> 3.0.0"},
     {:sweet_xml, "~> 0.3.0"},
     {:espec, "~> 1.1.0", only: :test},
     {:mix_test_watch, "~> 0.2", only: :dev},
     {:dogma, "~> 0.1", only: :dev},
     {:exq, "~> 0.7.2"},
     {:exq_ui, "~> 0.7.0"}
    #  {:rethinkdb_ecto, "~> 0.4"}
   ]
  end
end
