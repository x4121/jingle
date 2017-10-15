defmodule Mix.Tasks.Jingle.Seeds do
  use Mix.Task
  alias Jingle.{Event, Repo, Sound, Notification}

  def run(_) do
    Jingle.start(nil, nil)
    seed(Mix.env)
  end

  def seed(_) do
    Repo.delete_all(Sound)
    sounds = [
      %Sound{title: "Cantina band", vid: "sHD-knhS6es", duration: 43},
      %Sound{title: "Star Wars - Throne Room", vid: "BjDaPOWdx6s", start: 19, duration: 34},
      %Sound{title: "Sandstorm", vid: "y6120QOlsfU", start: 15, gain: 1.3},
      %Sound{title: "Android Porn", vid: "jr3XJr4FCYk", start: 24},
      %Sound{title: "Careless Whisper", vid: "izGwDsrQ1eQ"},
      %Sound{title: "Tunak Tunak", vid: "vTIIMJ9tUc8", start: 26},
      %Sound{title: "Epic Sax Guy", vid: "kxopViU98Xo"}
    ] |> Enum.map(&Repo.insert!/1)

    Repo.delete_all(Notification)
    default = %Notification{title: "default", sounds: sounds} |> Repo.insert!

    Repo.delete_all(Event)
    %Event{title: "Daily Standup", start: ~N[2000-01-01 10:00:00], frequency: "daily", notification: default} |> Repo.insert!
  end

  # def seed(:dev) do
  # end
  #
  # def seed(:prod) do
  # end
end
