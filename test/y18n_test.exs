defmodule Orisons.Y18NTest do
  use ExUnit.Case

  import Orisons.Y18N

  test "with translation" do
    assert y("Hello world") == "Witaj świecie"
  end

  test "without translation" do
    assert y("Apple") == "Apple"
  end

  test "plural translation \"a\"" do
    assert y("%d apple", "%d apples", 1) == "1 jabłko"
  end

  test "plural translation \"b\"" do
    assert y("%d apple", "%d apples", 2) == "2 jabłka"
  end

  test "plural translation \"c\"" do
    assert y("%d apple", "%d apples", 0) == "0 jabłek"
  end
end
