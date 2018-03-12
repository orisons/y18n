# Configuration

Settings group for `Orisons.Y18N`:
```elixir
config :y18n, 
  # ...
```

## Default language
With this option you can setup default translation language.

```elixir
language: :pl
```

## Session name
By default `Orisons.Y18N` will check current language in `Plug.Conn` by session key `:orisons_y18n_session`,
with this option you can change the session key which the language will be checked.

```elixir
session_name: :some_other_key
```

## Custom plural languages
If you need add new language to translate which is not supported by default, 
you can add modules with behaviour `Orisons.Y18N.Plural`.

```elixir
custom_plurals: [
    languange_key: YourApp.LanguageModule
  ]
```