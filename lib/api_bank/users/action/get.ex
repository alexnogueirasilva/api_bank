defmodule ApiBank.Users.Action.Get do
  @moduledoc """
  This module is responsible for the user get action.
  """

  alias ApiBank.Users.User
  alias ApiBank.Repo

  def call(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
