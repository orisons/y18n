defmodule Orisons.Y18N.Plural.Ro do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 -> "a"
      n when n == 0 or (rem(n, 100) > 0 and rem(n, 100) < 20) -> "b"
      _ -> "c"
    end
  end

  def variants do
    3
  end
end
