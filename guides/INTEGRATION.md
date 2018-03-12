# Integration


## Plug
```elixir
  defmodule MyPlug do
    import Plug.Conn
    import Orisons.Y18N

    # ...

    def call(conn, _opts) do
      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, y(conn, "Hello world"))
    end

    # ...
  end
```

## Phoenix framework

Modify file `yourappweb.ex` and add import of `Orisons.Y18N` module inside `view/0` function.
```elixir
defmodule YourAppWeb do
  # ...

  def view do
    # ...

    # Add import of Orisons.Y18N
    import Orisons.Y18N
    
    # ...
  end

  # ...
end
```

Then you can use `y/2` or `y/4` in templates
```elixir
<%= y(@conn, "Hello world") %>
<%= y(@conn, "%d apple", "%d apples", apples_count) %>
```