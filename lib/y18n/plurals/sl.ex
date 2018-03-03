defmodule Orisons.Y18N.Plural.Sl do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when rem(n, 100) == 1 -> "a"
      n when rem(n, 100) == 2 -> "b"
      n when rem(n, 100) == 3 or rem(n, 100) == 4 -> "c"
      _ -> "d"
    end
  end

  def variants do
    4
  end
end
