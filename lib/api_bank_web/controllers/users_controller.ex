defmodule ApiBankWeb.UsersController do
  @moduledoc """
  This module is responsible for the users' controller.
  """

  use ApiBankWeb, :controller
  alias ApiBank.Users
  alias Users.User

  action_fallback ApiBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
