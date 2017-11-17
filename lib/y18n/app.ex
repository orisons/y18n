defmodule Orisons.Y18N.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    {:ok, pid} = Supervisor.start_link([
      {Orisons.Y18N.Parser, [:hello]}
    ], strategy: :one_for_one)
  end

end