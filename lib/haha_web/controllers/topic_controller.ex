defmodule HahaWeb.TopicController do
  use HahaWeb, :controller

  # def index(conn, _params) do
  #   render(conn, "index.html")
  # end

  def new(conn, _params) do
    render(conn, "index.html")
  end
end
