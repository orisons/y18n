defmodule Orisons.Y18N.Plural.Sr do
  @behaviour Orisons.Y18N.Plural

  def check(count) do
    case abs(count) do
      n when rem(n, 10) == 1 and rem(n, 100) != 11 ->
        "a"

      n when rem(n, 10) >= 2 and rem(n, 10) <= 4 and (rem(n, 100) < 10 or rem(n, 100) >= 20) ->
        "b"

      _ ->
        "c"
    end
  end

  def variants do
    3
  end
end
