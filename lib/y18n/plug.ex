defmodule Orisons.Y18N.Plug do
  alias Orisons.Y18N.Parser
  
  defmacro y(string) do
    quote bind_quoted: [string: string] do
      Parser.get_translation(string, Parser.get_language(var!(conn)))
    end
  end
  
  defmacro y(string, string_plural, count) do
    quote bind_quoted: [string: string, string_plural: string_plural, count: count] do
      Parser.get_translation_plural(string, string_plural, count, Parser.get_language(var!(conn)))
    end
  end

end