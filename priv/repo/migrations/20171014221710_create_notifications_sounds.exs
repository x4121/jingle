defmodule Jingle.Repo.Migrations.CreateNotificationsSounds do
  use Ecto.Migration

  def change do
    create table(:notifications_sounds, primary_key: false) do
      add :notification_id, references(:notifications, on_delete: :delete_all)
      add :sound_id, references(:sounds, on_delete: :delete_all)
    end
  end
end
