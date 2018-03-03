defmodule Orisons.Y18N.Plural.Jv do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n != 0 -> "a"
      _ -> "b"
    end
  end

  def variants do
    2
  end
end
