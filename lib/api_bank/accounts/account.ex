defmodule ApiBank.Accounts.Account do
  @moduledoc """
  The account schema.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias ApiBank.Users.User

  @required_fields [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal, default: 0
    belongs_to :user, User

    timestamps()
  end

  def changeset(account \\ %__MODULE__{}, attrs) do
    account
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> check_constraint(:balance, name: :balance_must_be_positive)
    |> unique_constraint(:user_id, name: :unique_accounts_user_id)
  end
end
