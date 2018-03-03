defmodule Orisons.Y18N.Plural.Kw do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 -> "a"
      n when n == 2 -> "b"
      n when n == 3 -> "c"
      _ -> "d"
    end
  end

  def variants do
    4
  end
end
