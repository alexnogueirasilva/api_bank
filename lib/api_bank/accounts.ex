defmodule ApiBank.Accounts do
  @moduledoc """
  This module is responsible for the accounts context.
  """
  alias ApiBank.Action.Accounts.Create

  defdelegate create(params), to: Create, as: :call
end
