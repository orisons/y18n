defmodule Orisons.Y18N.Plural.My do
  @behaviour Orisons.Y18N.Plural

  def check(_count) do
    "a"
  end

  def variants do
    1
  end
end
