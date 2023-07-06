defmodule ApiBankWeb.UsersController do
  @moduledoc """
  This module is responsible for the users' controller.
  """

  use ApiBankWeb, :controller
  alias ApiBank.Users.Action.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, user: user)
  end
#
#  defp handle_response({:error, _changeset} = error, conn) do
#    conn
#    |> put_status(:unprocessable_entity)
#    |> json("error.json", error: error)
#  end
  
end
