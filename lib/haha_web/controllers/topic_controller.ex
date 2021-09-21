defmodule HahaWeb.TopicController do
  use HahaWeb, :controller
  alias HahaWeb.Topic

  # def index(conn, _params) do
  #   render(conn, "index.html")
  # end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(_conn, %{"topic" => topic}) do
    IO.inspect(topic)
  end
end
