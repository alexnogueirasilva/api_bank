defmodule ApiBank.Repo.Migrations.AddAccountsTable do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :balance, :decimal, null: false, default: 0
      timestamps()
    end

    create constraint(:accounts, :balance_must_be_positive, check: "balance >= 0")
  end
end
