defmodule Orisons.Y18N.Plural.Ga do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 -> "a"
      n when n == 2 -> "b"
      n when n > 2 and n < 7 -> "c"
      n when n > 6 and n < 11 -> "d"
      _ -> "e"
    end
  end

  def variants do
    5
  end
end
