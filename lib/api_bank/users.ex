defmodule ApiBank.Users do
  @moduledoc """
  This module is responsible for the users' context.
  """
  alias ApiBank.Users.Action.Create

  defdelegate create(params), to: Create, as: :call
  
end
