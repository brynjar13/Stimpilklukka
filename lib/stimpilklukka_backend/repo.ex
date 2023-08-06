defmodule StimpilklukkaBackend.Repo do
  use Ecto.Repo,
    otp_app: :stimpilklukka_backend,
    adapter: Ecto.Adapters.SQLite3
end
