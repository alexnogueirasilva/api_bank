defmodule ApiBank.Accounts.Action.Transaction do
  @moduledoc """
  This module is responsible for the transaction action.
  """
  alias ApiBank.Accounts
  alias Accounts.Account
  alias ApiBank.Repo
  alias Ecto.Multi

  def call(%{"from_account_id" => from_account_id, "to_account_id" => to_account_id , "value" => value}) do
    IO.inspect(from_account_id)
    IO.inspect(to_account_id)
    IO.inspect(value)
    with  :ok, %Account{} = from_account <- Repo.get(Account, from_account_id),
          :ok, %Account{} = to_account <- Repo.get(Account, to_account_id),
    {:ok, value} <- Decimal.cast(value) do
      Multi.new()
      |> withdraw(from_account, value)
      |> deposit(to_account, value)
      |> Repo.transaction()
      |> handle_result()
    else
      nil -> {:error, :not_found}
      :error -> {:error, :invalid_value}
    end
  end

  def call(_), do: {:error, :invalid_params}

  defp deposit(multi, from_account, value) do
    new_balance = Decimal.add(from_account.balance, value)
    changeset = Account.changeset(from_account, %{balance: new_balance})
    Multi.update(multi, :deposit, changeset)
  end

  defp withdraw(multi, to_account, value) do
    new_balance = Decimal.sub(to_account.balance, value)
    changeset = Account.changeset(to_account, %{balance: new_balance})
    Multi.update(multi, :withdraw, changeset)
  end

  defp handle_result({:ok, _result} = result), do: result
  defp handle_result({:error, _op, reason, _}), do: {:error, reason}
end
