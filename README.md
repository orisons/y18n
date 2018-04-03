# Readme

**Internationalization library based on YAML files.**

## Installation

Add `y18n` as dependency in `mix.exs`
```elixir
[{:y18n, "~> 1.0"}]
```

## Basic usage

Use translation functions `y/1` or `y/3`
```elixir
iex> y("Hello world") # Singular
"Witaj świecie"
iex> y("%d apple", "%d apples", 3) # Plural
"3 jabłka"
```
**To use with Plug or Phoenix framework go <a href="/y18n/integration.html">here</a>**

## Generate YAML file
```elixir
mix y18n.fetch
```
Translation files will be available in `priv/y18n/`. More info <a href="/y18n/Mix.Tasks.Y18n.Fetch.html">here</a>