defmodule Jingle.Sound do
  use Ecto.Schema
  alias Jingle.{Repo, Sound, Notification}

  schema "sounds" do
    field :title, :string
    field :vid, :string
    field :start, :integer, default: 0
    field :duration, :integer, default: 30
    field :gain, :float, default: 1.0
    many_to_many :notifications, Notification, join_through: "notifications_sounds"
    timestamps()
  end

  def get(title) do
    Repo.get_by!(Sound, title: title)
  end

  def play(%Sound{} = sound) do
    System.cmd("cvlc", [
      "--no-video",
      "--play-and-exit",
      "https://www.youtube.com/watch?v=#{sound.vid}",
      "--start-time=#{sound.start}",
      "--run-time=#{sound.duration}",
      "--gain-value=#{sound.gain}"
    ], stderr_to_stdout: true)
  end
end
