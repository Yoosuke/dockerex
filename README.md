# Dockerex

A mix task that creates a Phoenix framework docker file for studying mix tasks.

When you run ``` mix dokcerfile ```
Automatically generate dockerfile for the following environment.

```
FROM elixir:1.12.3

RUN apt-get update && apt-get install -y \
  inotify-tools git npm && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN mix do \
  local.hex --force, \
  local.reber --force, \
  archive.install --force hex phx.new 1.6.6

```
TODO:
Next, we will create a place to create docker-compose.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `dockerex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:dockerex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/dockerex>.

