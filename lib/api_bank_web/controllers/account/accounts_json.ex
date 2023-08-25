defmodule ApiBankWeb.Account.AccountsJSON do
  @moduledoc """
  The account return JSON.
  """
  alias ApiBank.Accounts.Account

  def create(%{account: account}) do
    %{
      message: "Account created successfully.",
      data: data(account)
    }
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      balance: account.balance,
    }
  end
end
