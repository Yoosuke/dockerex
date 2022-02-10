defmodule Dockerex do
  @moduledoc """
  Documentation for `Dockerex`.
  """

  @doc """
  Create a dockerfile for the Phoenixframework.

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

    ## Examples

      iex> Dockerex.create
      :ok

  """

  def create do
    write(build())
  end

  defp build() do
    """
    FROM elixir:1.12.3

    RUN apt-get update && apt-get install -y \\
      inotify-tools git npm && \\
      apt-get clean && \\
      rm -rf /var/lib/apt/lists/*

    WORKDIR /app

    RUN mix do \\
      local.hex --force, \\
      local.reber --force, \\
      archive.install --force hex phx.new 1.6.6
    """
  end

  defp write(contents) do
    path = case File.cwd do
      {:ok, path}  -> path
      _  -> "Error"
    end
    Path.join([path, "Dockerfile"])
    |> File.write(contents,[:append])
  end


end
