defmodule Orisons.Y18N.Plural.Lv do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when rem(n, 10) == 1 and rem(n, 100) != 11 -> "a"
      n when n != 0 -> "b"
      _ -> "c"
    end
  end

  def variants do
    3
  end
end
