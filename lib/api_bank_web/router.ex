defmodule ApiBankWeb.Router do
  use ApiBankWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ApiBankWeb.Plugs.Auth
  end

  scope "/api", ApiBankWeb do
    pipe_through :api

    get "/", WelcomeController, :index

    resources "/users", UsersController, only: [:create]
    post "/users/login", UsersController, :login
  end

  scope "/api", ApiBankWeb do
    pipe_through [:api, :auth]

    resources "/users", UsersController, only: [:show, :update, :delete]

    post "/accounts", Account.AccountsController, :create
    post "/accounts/transaction", Account.AccountsController, :transaction
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:api_bank, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: ApiBankWeb.Telemetry
    end
  end
end
