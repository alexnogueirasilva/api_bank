defmodule ApiBank.Users do
  @moduledoc """
  This module is responsible for the users' context.
  """
  alias ApiBank.Users.Action.Create
  alias ApiBank.Users.Action.Get

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call

end
