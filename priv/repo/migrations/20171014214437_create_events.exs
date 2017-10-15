defmodule Jingle.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :string
      add :start, :naive_datetime
      add :frequency, :string
      add :notification_id, references(:notifications)
      timestamps()
    end
  end
end
