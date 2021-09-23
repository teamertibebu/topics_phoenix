defmodule HahaWeb.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  alias HahaWeb.Router.Helpers, as: Routes

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You Must Be Logged In.")
      |> redirect(to: Routes.topic_path(conn, :index))
      |> halt()
    end
  end
end
