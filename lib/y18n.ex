defmodule Orisons.Y18N do
  @moduledoc """
  Module to get translation in a language specified in config.
  """

  alias Orisons.Y18N.Parser

  @doc """
  Reload translation from `yaml` files to `ets`.
  """
  @spec reload_translations() :: boolean
  def reload_translations do
    GenServer.call(Parser, :reload_translations)
  end

  @doc """
  Translate string from parameter to language specified in config.

  ## Examples
      iex> Orisons.Y18N.y("Hello world")
      "Witaj świecie"
  """
  @spec y(String.t()) :: String.t()
  def y(string) do
    Parser.get_translation(string)
  end

  @doc """
  Translate string from parameter to language specified in config with plural detection.

  ## Examples
      iex> Orisons.Y18N.y("%d apple", "%d apples", 3)
      "3 jabłka"
  """
  @spec y(String.t(), String.t(), number) :: String.t()
  def y(string, string_plural, count) do
    Parser.get_translation_plural(string, string_plural, count)
  end

  @doc """
  Translate string from parameter to language from session stored in `Plug.Conn`.

  ## Examples
      iex> Orisons.Y18N.y(conn, "Hello world")
      "Witaj świecie"
  """
  @spec y(Plug.Conn.t(), String.t()) :: String.t()
  def y(conn, string) do
    Parser.get_translation(string, Parser.get_language(conn))
  end

  @doc """
  Translate string from parameter to language from session stored in `Plug.Conn`, with plural detection.

  ## Examples
      iex> Orisons.Y18N.y(conn, "%d apple", "%d apples", 3)
      "3 jabłka"
  """
  @spec y(Plug.Conn.t(), String.t(), String.t(), number) :: String.t()
  def y(conn, string, string_plural, count) do
    Parser.get_translation_plural(string, string_plural, count, Parser.get_language(conn))
  end
end
