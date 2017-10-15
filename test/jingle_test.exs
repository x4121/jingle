defmodule JingleTest do
  use ExUnit.Case
  alias Jingle.{Repo, Event, Notification, Sound}
  import Ecto.Query

  doctest Jingle

  test "insert" do
    %Sound{title: "Cantina band", vid: "sHD-knhS6es", duration: 43} |> Repo.insert!
  end

  test "the truth" do
    assert 1 + 1 == 2
  end
end
