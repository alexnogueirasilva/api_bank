defmodule ApiBankWeb.Account.AccountsController do
  @moduledoc """
  This module is responsible for the accounts controller.
  """
  use ApiBankWeb, :controller

  alias ApiBank.Accounts
  alias Accounts.Account

  action_fallback ApiBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account)
      end
    end

    def transaction(conn, params) do
      with {:ok, transaction} <- Accounts.transaction(params) do
        conn
        |> put_status(:ok)
        |> render(:transaction, transaction: transaction)
      end
    end
end
