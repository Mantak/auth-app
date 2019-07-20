defmodule AuthAppWeb.Services.ErrorHandler do
  import Plug.Conn
  import Phoenix.Controller
  alias AuthAppWeb.Router.Helpers, as: Routes

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    body = to_string(type)
    conn
    |> put_resp_content_type("text/plain")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end