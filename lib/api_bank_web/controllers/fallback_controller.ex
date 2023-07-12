defmodule ApiBankWeb.FallbackController do
  @moduledoc """
  This module is responsible for the fallback controller.
  """

 use ApiBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: ApiBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end

end
