defmodule ApiBankWeb.WelcomeController do
  @moduledoc false

  use ApiBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to ApiBank API"})
  end

end
