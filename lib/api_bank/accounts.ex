defmodule ApiBank.Accounts do
  @moduledoc """
  This module is responsible for the accounts context.
  """
  alias ApiBank.Accounts.Action.Create
  alias ApiBank.Accounts.Action.Transaction

  defdelegate create(params), to: Create, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
