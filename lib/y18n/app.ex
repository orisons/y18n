defmodule Orisons.Y18N.App do
  @moduledoc false
  use Application

  def start(_type, _args) do
    {:ok, _} = Supervisor.start_link([
      {Orisons.Y18N.Parser, []}
    ], strategy: :one_for_one)
  end

end