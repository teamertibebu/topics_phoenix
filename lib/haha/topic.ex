defmodule HahaWeb.Topic do
  use HahaWeb, :model

  schema "topics" do
    field :title, :string
    belongs_to :user, HahaWeb.User
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
