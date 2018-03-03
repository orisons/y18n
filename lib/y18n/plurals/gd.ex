defmodule Orisons.Y18N.Plural.Gd do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 or n == 11 -> "a"
      n when n == 2 or n == 12 -> "b"
      n when n > 2 and n < 20 -> "c"
      _ -> "d"
    end
  end

  def variants do
    4
  end
end
