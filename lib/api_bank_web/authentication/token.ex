defmodule ApiBankWeb.Authentication.Token do
  @moduledoc """
  This module is responsible for the authentication token context.
  """
  alias Phoenix.Token
  alias ApiBankWeb.Endpoint

  @sing_salt "api_bank_web_token"

  def sing(user) do
    Token.sign(Endpoint, @sing_salt, %{user_id: user.id})
  end
  
  def verify(token), do: Token.verify(Endpoint, @sing_salt, token)
end
