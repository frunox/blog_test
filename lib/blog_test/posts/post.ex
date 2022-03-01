defmodule BlogTest.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :post_id, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:post_id])
    |> validate_required([:post_id])
  end
end
