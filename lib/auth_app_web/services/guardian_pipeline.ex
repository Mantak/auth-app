defmodule AuthAppWeb.Services.GuardianPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :auth_app,
    error_handler: AuthAppWeb.Services.ErrorHandler,
    module: AuthAppWeb.Services.Guardian

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end