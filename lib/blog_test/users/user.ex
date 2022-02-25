defmodule BlogTest.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  use Pow.Extension.Ecto.Schema

  schema "users" do
    field :username, :string
    pow_user_fields()

    timestamps()
  end
  
  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:username])
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
    |> IO.inspect
  end
end
