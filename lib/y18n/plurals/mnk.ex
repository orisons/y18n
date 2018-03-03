defmodule Orisons.Y18N.Plural.Mnk do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 0 -> "a"
      n when n == 1 -> "b"
      _ -> "c"
    end
  end

  def variants do
    3
  end
end
