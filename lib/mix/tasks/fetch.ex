defmodule Mix.Tasks.Y18n.Fetch do
  @moduledoc """
  Mix task to genereate `.yaml` file based on project files and functions `y/1`, `y/3`
  """

  use Mix.Task

  # Mix.Task.run("Y18N.Fetch", ["priv/templates/**/*.eex"])

  # @spec run(args) :: boolean()
  @doc """
  Generate `.yaml` file based on project files and functions `y/1`, `y/3`.
  
  Default create `schema.yaml` file and save in `priv/y18n`.

  ## Parameters
  `mix y18n.fetch --lang="pl"` Create yaml file for specific language.

  `mix y18n.fetch "priv/templates/**/*.eex"` Add directory to detect `y/1`, `y/3` functions.

  """
  def run(args) do
    options = OptionParser.parse(args, switches: [lang: :string])

    {lang, paths} = case options do
      {[lang: lang], paths, []} -> {String.to_atom(lang), paths}
      {[], paths, []} -> {:schema, paths}
    end

    strings = parse(paths, lang)
    
    case lang do
      nil -> write("schema", strings)
      lang -> merge(lang, strings)
    end
  end

  defp parse(paths, lang) do
    Enum.reduce(paths, [], fn(x, acc) ->
      Enum.concat(Path.wildcard(x), acc)
    end)
    |> Enum.concat(Path.wildcard("lib/**/*.ex"))
    |> Enum.reduce(Map.new, fn(path, acc) ->
      {:ok, file} = File.open(path, [:read])
      content = IO.read(file, :all)

      detected = detect(content, lang)

      Map.merge(detected, acc)
    end)
  end

  defp detect(content, lang) do
    variants = case Orisons.Y18N.Plural.get_plural(lang) do
      {:error, _} -> 2
      {:ok, module} -> module.variants()
    end

    Regex.scan(~r/y\(\"([^\"]+)\"(,\s?\"([^\"]+)\",([^\)]+))?\)/, content)
    |> Enum.reduce(Map.new, fn(x, acc) -> 
      case x do
        [_, string] -> Map.put(acc, string, 1)
        [_, string, _, _, _] -> Map.put(acc, string, variants)
      end
    end)
  end

  defp merge(lang, strings) do
    :application.ensure_started(:yamerl)
    :application.ensure_started(:yaml_elixir)

    path = Path.expand("priv/y18n/#{lang}.yaml")
    current_strings = YamlElixir.read_from_file(path)

    translated = Enum.filter(Map.keys(strings), fn(x) -> Map.has_key?(current_strings, x) == false end)
    to_translate = Map.take(strings, translated)
    write(lang, to_translate, :append)
  end

  defp write(file, strings, mode \\ :write) do
    content = Enum.reduce(strings, "", fn(item, acc) ->
      {string, variants} = item
      case variants do
        1 -> "\"#{string}\": \n" <> acc
        count ->
          Enum.reduce(0..count-1, "\"#{string}\": \n" <> acc, fn(index, acc) -> 
            acc = acc <> "  " <> << Enum.at(?a..?z, index) :: utf8 >> <> ": \n"
          end)
      end
    end)

    content = case mode do
      :append -> "\n" <> content
      _ -> content
    end

    Path.expand("priv/y18n/#{file}.yaml")
    |> Path.absname
    |> File.write(content, [mode])
  end
end