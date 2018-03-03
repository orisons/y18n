defmodule Orisons.Y18N.Plural.Tr do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n > 1 -> "a"
      _ -> "b"
    end
  end

  def variants do
    2
  end
end
