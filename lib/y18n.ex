defmodule Orisons.Y18N do
  alias Orisons.Y18N.Parser

  def reload_translations do
    GenServer.call(Parser, :reload_translations)
  end

  def y(string) do
    Parser.get_translation(string)
  end

  def y(string, string_plural, count) do
    Parser.get_translation_plural(string, string_plural, count)
  end

end