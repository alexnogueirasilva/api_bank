defmodule ApiBankWeb.WelcomeController do
  @moduledoc """
  This module is responsible for the welcome controller.
  """

  use ApiBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to ApiBank API"})
  end

end
