defmodule Orisons.Y18N.Parser do
  use GenServer

  @ets_name :orisons_y18n_parser
  @session_name :orisons_y18n_session

  def start_link(state) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(langs) do
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
          |> IO.inspect()
          Keyword.put(acc, file_name, file)
        catch
          x -> 
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
      |> Enum.reduce([], fn({lang, items}, acc) ->
        translations = Enum.map(items, fn {k, v} -> {String.Chars.to_string(k), String.Chars.to_string(v)} end) |> Map.new
        [{lang, translations} | acc]
      end)
  end

  def get_translation(string), do: get_translation(string, get_language)
  def get_translation(string, lang) do
    case :ets.match(@ets_name, {lang, %{string => :"$2"}}) do
      [[translated]] -> translated
      _ -> string
    end
    |> IO.inspect()
  end

  def get_language, do: Application.get_env(:y18n, :language)
  def get_language(conn) do
    case Plug.Conn.get_session(conn, @session_name) do
      nil -> Application.get_env(:y18n, :language)
      lang -> lang
    end
  end

  def handle_call(:reload_translations, _, message) do
    case :ets.insert(@ets_name, get_all_langs()) do
      true -> {:reply, {:ok}, message}
      false -> {:reply, {:error}, message}
    end
  end

end