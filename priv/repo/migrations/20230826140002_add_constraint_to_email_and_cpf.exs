defmodule ApiBank.Repo.Migrations.AddConstraintToEmailAndCpf do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:email], name: :unique_users_email)
    create unique_index(:users, [:cpf], name: :unique_users_cpf)
  end
end
