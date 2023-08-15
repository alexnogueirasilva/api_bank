defmodule ApiBank.Users.Action.Delete do
  @moduledoc false

  alias ApiBank.Users.User
  alias ApiBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
