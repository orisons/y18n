defmodule Orisons.Y18N.Plural.Is do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when rem(n, 10) != 1 or rem(n, 100) == 11 -> "a"
      _ -> "b"
    end
  end

  def variants do
    2
  end
end
