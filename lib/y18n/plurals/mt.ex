defmodule Orisons.Y18N.Plural.Mt do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 -> "a"
      n when n == 0 or (rem(n, 100) > 1 and rem(n, 100) < 11) -> "b"
      n when rem(n, 100) > 10 and rem(n, 100) < 20 -> "c"
      _ -> "d"
    end
  end

  def variants do
    4
  end
end
