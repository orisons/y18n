defmodule Orisons.Y18N.Plural do

  defmodule LanguageException do
    @moduledoc """
    Exception raised when trying `get_plural!/1` for not defined language `behaviour` module.
    """

    defexception message: "Language not available in y18n."
  end

  @doc """
  Return variant of plural based on integer
  """
  @callback check(integer) :: binary

  @doc """
  Inform about amount of vartiants that can be returned by `check/1`
  """
  @callback variants() :: integer

  @doc """
  Keyword list of modules where key is language shortcut
  """
  def get_plurals do
    [
      en: Orisons.Y18N.Plural.En,
      pl: Orisons.Y18N.Plural.Pl
    ]
  end

  @doc """
  Get plural module by language shortcut

  ## Example:

      iex> Orisons.Y18N.Plural.get_plural(:en)
      {:ok, Orisons.Y18N.Plural.En}

  """
  def get_plural(lang) do
    Keyword.fetch(get_plurals(), lang)
    |> case do
      :error -> {:error, "Language not available in y18n."}
      {:ok, module} -> {:ok, module}
    end
  end

  @doc """
  Same as `Orisons.Y18N.Plural.get_plural/1`, but if language is not defined will throw `Orisons.Y18N.Plural.LanguageException`
  """
  def get_plural!(lang) do
    Keyword.fetch(get_plurals(), lang)
    |> case do
      :error -> raise LanguageException
      {:ok, module} -> module
    end
  end

  @doc """
  Determinates plural variant based on `count` and `lang`

  ## Example:

      iex> Orisons.Y18N.Plural.get_plural_count(1, :pl)
      "a"

  """
  def get_plural_count(count, lang) do
    plural = get_plural!(lang)
    plural.check(count)
  end

end
