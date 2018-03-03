defmodule Orisons.Y18N.Plural.Cs do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 -> "a"
      n when n >= 2 and n <= 4 -> "b"
      _ -> "c"
    end
  end

  def variants do
    3
  end
end
