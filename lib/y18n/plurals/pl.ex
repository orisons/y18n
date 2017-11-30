defmodule Orisons.Y18N.Plural.Pl do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 -> 0
      n when rem(n, 10) >= 2 and rem(n, 10) <= 4 and (rem(n, 100) < 10 or rem(n, 100) >= 20) -> 1
      _ -> 2
    end
  end

  def variants do
    3
  end

end