defmodule Orisons.Y18NTest do
  use ExUnit.Case
  doctest Orisons.Y18N

  import Orisons.Y18N

  test "with translation" do
    assert y("Hello World") == "Witaj świecie"
  end

  test "without translation" do
    assert y("Apple") == "Apple"
  end
end
