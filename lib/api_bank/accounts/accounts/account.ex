defmodule ApiBank.Accounts.Account do
  @moduledoc """
  The account schema.
  """
  use Ecto.Schema
  use ApiBank.Accounts.User
  import Ecto.Changeset

  @required_fields [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal, default: 0
    belongs_to :user, User
  end

  def changeset(account \\ %__MODULE__{}, attrs) do
    account
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:balance, :balance_must_be_positive)
  end
end
