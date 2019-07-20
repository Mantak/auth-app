defmodule AuthAppWeb.Router do
  use AuthAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug AuthAppWeb.Services.GuardianPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuthAppWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    post "/authenticate", PageController, :authenticate
  end

  scope "/", AuthAppWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/dashboard", PageController, :dashboard
    get "/logout", PageController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuthAppWeb do
  #   pipe_through :api
  # end
end
