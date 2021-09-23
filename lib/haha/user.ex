defmodule HahaWeb.User do
  use HahaWeb, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :token, :string
    field :provider, :string
    has_many :topics, HahaWeb.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :token, :provider])
    |> validate_required([:name, :email, :token, :provider])
  end
end
