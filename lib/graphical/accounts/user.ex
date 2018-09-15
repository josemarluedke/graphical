defmodule Graphical.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
      require Logger


  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :posts, Graphical.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end

  def update_changeset(user, params \\ %{}) do
  Logger.debug "Var value: #{inspect(params)}"
    user
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email])
    |> put_pass_hash()
  end

  def registration_changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
