defmodule Haha.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :provider, :string
      add :token, :string

      timestamps()
    end
  end
end
