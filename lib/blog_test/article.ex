defmodule BlogTest.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :article_id, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:article_id])
    |> validate_required([:article_id])
  end
end
