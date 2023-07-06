defmodule Users.User do
  @moduledoc
  """
  This module is responsible for the user model.
  """
  @required_fields [:name, :email, :password_hash, :cpf, :cep]
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :cpf, :string
    field :cep, :string

    timestamps()
  end

  @doc
  """
  This function is responsible for the changeset of the user model.
  """

  def changeset(user \\%__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:name, min: 3, max: 40)
    |> validate_length(:cep, min: 8, max: 8)
    |> validate_format(:email, ~r/@/)
  end
  
end
