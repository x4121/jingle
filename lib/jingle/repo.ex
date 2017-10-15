defmodule Jingle.Repo do
  use Ecto.Repo, otp_app: :jingle, adapter: Sqlite.Ecto2
end
