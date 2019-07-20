defmodule AuthAppWeb.PageController do
  use AuthAppWeb, :controller
  alias AuthAppWeb.Services.{Auth, Guardian}
  alias AuthApp.Accounts.User

  def index(conn, _params) do
    if Guardian.Plug.current_resource(conn) do
      redirect(conn, to: Routes.page_path(conn, :dashboard))
    else
      changeset = User.changeset(%User{}, %{})
      render(conn, "index.html", changeset: changeset)
    end
  end

  def authenticate(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Auth.verify_account(email, password) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: Routes.page_path(conn, :dashboard))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Username/Password is invalid.")
        |> index(%{})
    end  
  end

  def dashboard(conn, _params) do
    render(conn, "dashboard.html", quote: get_quote())
  end

  def logout(conn, _params) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: Routes.page_path(conn, :index))
  end

  defp get_quote do
    HTTPoison.start()
    case HTTPoison.get("https://thesimpsonsquoteapi.glitch.me/quotes", [{"Accept", "application/json"}]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        [head | _tail] = Jason.decode!(body)
        head
      _ -> %{}
    end
  end
end
