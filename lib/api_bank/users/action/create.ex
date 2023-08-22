defmodule ApiBank.Users.Action.Create do
  @moduledoc """
  This module is responsible for the user creation action.
  """
  alias ApiBank.Users.User
  alias ApiBank.Repo
  alias ApiBank.ViaCep.Client, as: ViaCepClient

  @doc """
  This function is responsible for the user creation action.
  """
  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.call(cep) do

    params
    |> User.changeset()
    |> Repo.insert()
    end
  end
end