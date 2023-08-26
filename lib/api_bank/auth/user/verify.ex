defmodule ApiBank.Auth.User.Verify do
  @moduledoc """
  This module is responsible for verifying the user's credentials.
  """
  alias ApiBank.Users

  def call(%{"email" => email, "password" => password}) do
    case Users.get(email) do
      {:ok, user} -> verify_password(user, password)
          {:error, _} = error -> error
    end
  end

  defp verify_password(user, password) do
  case  Argon2.verify_pass(password, user.password_hash) do
    true -> {:ok, user}
    false -> {:error, :unauthorized}
    end
  end
end