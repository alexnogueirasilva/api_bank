defmodule ApiBank.Repo.Migrations.AddConstraintToAccounts do
  use Ecto.Migration

  def change do
    create unique_index(:accounts, [:user_id], name: :unique_accounts_user_id)
  end
end
