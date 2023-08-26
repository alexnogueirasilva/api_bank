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

  def transaction(%{transaction: %{withdraw: from_account, deposit: to_account}}) do
    %{
      message: "Transaction created successfully.",
      from_account: data(from_account),
      to_accoubt: data(to_account),
    }
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      balance: account.balance,
      user_id: account.user_id
    }
  end
end
