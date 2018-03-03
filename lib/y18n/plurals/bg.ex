defmodule Orisons.Y18N.Plural.Bg do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n != 1 -> "a"
      n when n == 1 -> "b"
    end
  end

  def variants do
    2
  end
end
