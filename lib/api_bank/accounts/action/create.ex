defmodule ApiBank.Action.Accounts.Create do
  @moduledoc """
  This module is responsible for the create action.
  """
  alias ApiBank.Repo
  alias ApiBank.Accounts.Account

  def call(params) do
    params
    |> Account.changeset()
    |> Repo.insert()
  end
end
