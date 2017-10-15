defmodule Jingle.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications) do
      add :title, :string
      add :description, :string
      timestamps()
    end

    create unique_index(:notifications, [:title])
  end
end
