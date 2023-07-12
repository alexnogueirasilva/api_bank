defmodule ApiBankWeb.UsersJSON do
  @moduledoc """
  This module is responsible for the users' json.
  """

  alias ApiBank.Users.User

  def show(%{user: user}), do: %{data: data(user)}

  def create(%{user: user}) do
    %{
      message: "User created successfully",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      name: user.name,
      email: user.email,
      cpf: user.cpf,
      cep: user.cep
    }
  end

end
