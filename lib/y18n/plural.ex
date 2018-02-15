defmodule Orisons.Y18N.Plural do

  defmodule LanguageException do
    @moduledoc """
    Exception raised when trying `get_plural!/1` for not defined language `behaviour` module.
    """

    defexception message: "Language not available in y18n."
  end
  
  @callback check(integer) :: integer
  @callback variants() :: integer

  def get_plurals do
    [
      en: Orisons.Y18N.Plural.En,
      pl: Orisons.Y18N.Plural.Pl
    ]
  end

  def get_plural(lang) do
    Keyword.fetch(get_plurals(), lang)
    |> case do
      :error -> {:error, "Language not available in y18n."}
      {:ok, module} -> {:ok, module}
    end
  end

  def get_plural!(lang) do
    Keyword.fetch(get_plurals(), lang)
    |> case do
      :error -> raise LanguageException
      {:ok, module} -> module
    end
  end

  def get_plural_count(count, lang) do
    plural = get_plural!(lang)
    plural.check(count)
  end

end
