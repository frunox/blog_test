defmodule BlogTest.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :article_id, :string

      timestamps()
    end
  end
end
