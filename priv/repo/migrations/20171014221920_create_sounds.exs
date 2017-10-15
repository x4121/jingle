defmodule Jingle.Repo.Migrations.CreateSounds do
  use Ecto.Migration

  def change do
    create table(:sounds) do
      add :title, :string
      add :vid, :string
      add :start, :integer
      add :duration, :integer
      add :gain, :float
      timestamps()
    end

    create unique_index(:sounds, [:title])
  end
end
