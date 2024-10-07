defmodule Ftat.Repo do
  use Ecto.Repo,
    otp_app: :ftat,
    adapter: Ecto.Adapters.Postgres
end
