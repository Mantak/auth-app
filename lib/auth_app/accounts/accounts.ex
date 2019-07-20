defmodule AuthApp.Accounts do
  import Ecto.Query, warn: false
  alias AuthApp.Accounts.User
  alias AuthApp.Repo

  @spec create_user(map()) :: {:ok, %User{}}
  def create_user(attrs) do
    User
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @spec get_user(atom(), String.id()) :: %User{}
  def get_user(key, value) do
    Repo.get_by(User, key, value)
  end

  @spec update_user(%User{}, map()) :: {:ok, %User{}}
  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end
