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

  def delete(%{user: user}) do
    %{
      message: "User deleted successfully",
      data: data(user)
    }
  end

  def login(%{token: token}) do
    %{
      message: "User logged in successfully",
      data: %{
        type: "bearer",
        token: token
      }
    }
  end

  def update(%{user: user}) do
    %{
      message: "User updated successfully",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cpf: user.cpf,
      cep: user.cep
    }
  end
end
