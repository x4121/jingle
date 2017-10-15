defmodule Jingle do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Jingle.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Jingle.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
