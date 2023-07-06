defmodule ApiBank.Users.Action.Create do
  @moduledoc """
  This module is responsible for the user creation action.
  """
  alias ApiBank.Users.User
  alias ApiBank.Repo

  @doc """
  This function is responsible for the user creation action.
  """
  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end