defmodule Orisons.Y18N.Plural.Ar do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 0 -> "a"
      n when n == 1 -> "b"
      n when n == 2 -> "c"
      n when rem(n, 100) >= 3 and rem(n, 100) <= 10 -> "d"
      n when rem(n, 100) >= 11 -> "e"
      _ -> "f"
    end
  end

  def variants do
    6
  end
end
