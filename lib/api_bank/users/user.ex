defmodule ApiBank.Users.User do
  @moduledoc """
  This module is responsible for the user model.
  """

  @required_fields [:name, :email, :password, :cpf, :cep]
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :cpf, :string
    field :cep, :string

    timestamps()
  end

  @doc"""
  This function is responsible for the changeset of the user model.
  """

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 3, max: 40)
    |> validate_length(:cep, is: 8)
    |> validate_format(:email, ~r/@/)
    |> add_password_hash()
  end
  
  defp add_password_hash(
        %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp add_password_hash(changeset), do: changeset
  
end
