defmodule Orisons.Y18N.Parser do
  @moduledoc """
  Module parse `.yaml` files and store translations in `ets` table, also contain functions to get translations from same `ets` table.
  """

  use GenServer

  defmodule PlugException do
    @moduledoc """
    Exception raised when trying use `Orisons.Plug` without `plug` dependency.
    """

    defexception message: "Module 'Plug.Conn' is not available, check 'plug' is in deps."
  end

  @ets_name :orisons_y18n_parser
  @session_name :orisons_y18n_session

  @doc false
  def start_link(_state) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @doc false
  def init(_) do
    table = :ets.new(@ets_name, [:set, :protected, :named_table])
    :ets.insert(@ets_name, get_all_langs())
    {:ok, table}
  end
  
  defp get_all_langs do
    Path.wildcard("priv/y18n/*.yaml")
      |> Enum.reduce([], fn(item, acc) ->
        try do
          file_name = Path.basename(item, ".yaml") |> String.to_atom
          file = YamlElixir.read_from_file(item)
          Keyword.put(acc, file_name, file)
        catch
          _ -> 
            IO.write :stderr, """
            The translation file #{IO.ANSI.red}\"#{item}\"#{IO.ANSI.reset} is not correctly formatted.
            
            Example:
            Original: Translation
            #{IO.ANSI.green}Hello world: Witaj świecie#{IO.ANSI.reset}
            #{IO.ANSI.red}Example#{IO.ANSI.reset}
            #{IO.ANSI.green}'Some (info)': 'Pewna (informacja)'#{IO.ANSI.reset}
            #{IO.ANSI.red}Some (info): Pewna (informacja)#{IO.ANSI.reset}
            
            """
            acc
        end
      end)
  end

  @doc """
  Get translation of string in language specified in config
  """
  def get_translation(string), do: get_translation(string, get_language())

  @doc """
  Get translation of string in specific language
  """
  def get_translation(string, lang) do
    case :ets.match(@ets_name, {lang, %{string => :"$2"}}) do
      [[translated]] when is_binary(translated) and byte_size(translated) > 0 -> translated
      _ -> string
    end
  end

  alias Orisons.Y18N.Plural

  def get_translation_plural(string, string_plural, count), do: get_translation_plural(string, string_plural, count, get_language())
  def get_translation_plural(string, string_plural, count, lang) do
    case :ets.match(@ets_name, {lang, %{string => :"$2"}}) do
      [[translated]] when is_map(translated) ->
        nplural = Plural.get_plural_count(count, lang)
        Map.get(translated, nplural, string)
      _ -> 
        case Plural.get_plural_count(count, :en) do
          0 -> string
          1 -> string_plural
        end
    end
    |> String.replace("%d", Integer.to_string(count))
  end

  @doc """
  Get current language from application config
  """
  def get_language, do: Application.get_env(:y18n, :language)

  @doc """
  Get current language from `Plug.Conn` session with key `:orisons_y18n_session`
  """
  def get_language(conn) do
    case Code.ensure_loaded(Plug.Conn) do
      {:module, module} ->
        case module.get_session(conn, get_session_name()) do
          nil -> Application.get_env(:y18n, :language)
          lang -> lang
        end
      {:error, :nofile} -> raise PlugException
    end
  end

  defp get_session_name do
    Application.get_env(:y18n, :session_name, @session_name)
  end

  def handle_call(:reload_translations, _, message) do
    case :ets.insert(@ets_name, get_all_langs()) do
      true -> {:reply, {:ok}, message}
      false -> {:reply, {:error}, message}
    end
  end

end
