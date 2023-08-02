defmodule ApiBank.Users.Action.Update do
  @moduledoc """
  This module is responsible for the user update action.
  """

  alias ApiBank.Users.User
  alias ApiBank.Repo

  @doc """
  This function is responsible for the user update action.
  """

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
