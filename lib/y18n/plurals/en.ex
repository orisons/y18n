defmodule Orisons.Y18N.Plural.En do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when n == 1 -> 0
      n when n != 1 -> 1
    end
  end

end