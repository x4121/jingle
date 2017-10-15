defmodule Jingle.Notification do
  use Ecto.Schema
  alias Jingle.{Event, Notification, Sound, Repo}
  import Ecto.Query

  schema "notifications" do
    field :title, :string
    field :description, :string
    has_many :events, Event
    many_to_many :sounds, Sound, join_through: "notifications_sounds"
    timestamps()
  end

  def get(title) do
    Repo.get_by!(Notification, title: title)
  end

  def raise(%Notification{} = notification) do
    (from s in Sound,
     join: n in assoc(s, :notifications),
     where: n.id == ^notification.id,
     select: s)
     |> Repo.all
     |> Enum.random
     |> Sound.play
  end
end
