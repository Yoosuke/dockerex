defmodule Mix.Tasks.Dockerex do
  @moduledoc "The hello mix task: `mix help dokcerex`"
  use Mix.Task

  @shortdoc "Simply calls the Dockerex.create/0 function."
  def run(_) do
    # This will start our application
    Mix.Task.run("app.start")

    # calling our Hello.say() function from earlier
    Dockerex.create()
  end
end
