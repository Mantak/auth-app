defmodule AuthApp.Accounts do
  import Ecto.Query, warn: false
  alias AuthApp.Accounts.User
  alias AuthApp.Repo

  @spec create_user(map()) :: {:ok, %User{}}
  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @spec get_user(String.id()) :: %User{}
  def get_user(id), do: Repo.get(User, id)

  @spec get_user_by_email(String.t()) :: %User{}
  def get_user_by_email(email), do: Repo.get_by(User, [email: email])

  @spec update_user(%User{}, map()) :: {:ok, %User{}}
  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end
end
