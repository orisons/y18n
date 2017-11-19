defmodule Mix.Tasks.Y18N.CreateYAML do
  use Mix.Task

  # Mix.Task.run("Y18N.CreateYAML", ["priv/templates/**/*.eex"])

  def run(args) do
    options = OptionParser.parse(args, switches: [lang: :string])

    {lang, paths} = case options do
      {[lang: lang], paths, []} -> {lang, paths}
      {[], paths, []} -> {nil, paths}
    end

    strings = parse(paths)
    
    case lang do
      nil -> write("schema", strings)
      lang -> merge(lang, strings)
    end
  end

  defp parse(paths) do
    Enum.reduce(paths, [], fn(x, acc) ->
      Enum.concat(Path.wildcard(x), acc)
    end)
    |> Enum.concat(Path.wildcard("lib/**/*.ex"))
    |> Enum.reduce([], fn(path, acc) ->
      {:ok, file} = File.open(path, [:read])
      to_translate = IO.read(file, :all) 
        |> (&Regex.scan(~r/y\(\"([^\"]+)\"\)/, &1)).()
        |> Enum.reduce([], fn(x, acc) -> 
          [_, string] = x
          [string | acc]
        end)
      Enum.concat(to_translate, acc)
    end)
    |> Enum.uniq
  end

  defp merge(lang, strings) do
    :application.start(:yamerl)
    :application.start(:yaml_elixir)

    path = Path.expand("priv/y18n/#{lang}.yaml")
    current_strings = YamlElixir.read_from_file(path)
    
    to_translate = Enum.filter(strings, fn(x) -> Map.has_key?(current_strings, x) == false end)
    write(lang, to_translate, :append)
  end

  defp write(file, strings, mode \\ :write) do
    content = Enum.reduce(strings, "", fn(item, acc) ->
      "#{item}: \n" <> acc
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