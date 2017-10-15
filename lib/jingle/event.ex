defmodule Jingle.Event do
  use Ecto.Schema
  alias Jingle.{Notification, Repo, Event}
  import Ecto.{Changeset, Query}

  schema "events" do
    field :title, :string
    field :description, :string
    field :start, :naive_datetime
    field :frequency, Event.Frequency
    belongs_to :notification, Notification
    timestamps()
  end

  def trigger(%Event{} = event) do
    (from n in Notification,
     where: n.id == ^event.notification_id)
     |> Repo.one
     |> Notification.raise
  end

  # def update(%Event{} = event) do
  #   event
  #   |> Changeset.cast(%{start: NaiveDateTime.add(event.start, 1, :day)}, [:start])
  #   |> Repo.update!
  # end
end
