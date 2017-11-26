defmodule Orisons.Y18N.Plural do
  
  @callback check(integer) :: integer

  def get_plurals do
    [
      en: Orisons.Y18N.Plural.En,
      pl: Orisons.Y18N.Plural.Pl
    ]
  end

  def get_plural(count, lang) do
    plural = get_plurals() |> Keyword.fetch!(lang)
    plural.check(count)
  end

end