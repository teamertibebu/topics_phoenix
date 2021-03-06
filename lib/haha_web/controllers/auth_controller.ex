defmodule HahaWeb.AuthController do
  use HahaWeb, :controller
  alias HahaWeb.User
  import Ecto.Query
  alias Haha.Repo

  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{
      token: auth.credentials.token || "token",
      email: auth.info.email || "teamer.tibebu@revelry.co",
      name: auth.info.name || "name",
      provider: to_string(auth.provider)
    }

    changeset = User.changeset(%User{}, user_params)

    sign_in(conn, changeset)
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.topic_path(conn, :index))
  end

  defp sign_in(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome Back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Error Signing In")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case(Repo.get_by(User, email: changeset.changes.email)) do
      nil -> Repo.insert(changeset)
      user -> {:ok, user}
    end
  end
end
