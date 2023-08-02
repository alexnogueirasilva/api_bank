defmodule ApiBank.Users do
  @moduledoc """
  This module is responsible for the users' context.
  """
  alias ApiBank.Users.Action.Create
  alias ApiBank.Users.Action.Get
  alias ApiBank.Users.Action.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call

end
