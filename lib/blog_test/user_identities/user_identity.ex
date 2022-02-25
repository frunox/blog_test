defmodule BlogTest.UserIdentities.UserIdentity do
  use Ecto.Schema
  use PowAssent.Ecto.UserIdentities.Schema, user: BlogTest.Users.User

  schema "user_identities" do
    # field :username, :string
    pow_assent_user_identity_fields()

    timestamps()
  end
end
