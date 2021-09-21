defmodule HahaWeb.TopicController do
  use HahaWeb, :controller
  alias HahaWeb.Topic
  alias Haha.Repo

  # def index(conn, _params) do
  #   render(conn, "index.html")
  # end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(_conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    Repo.insert(changeset)
  end
end
