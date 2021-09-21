defmodule Haha.Repo do
  use Ecto.Repo,
    otp_app: :haha,
    adapter: Ecto.Adapters.Postgres
end
