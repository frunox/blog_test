defmodule BlogTest.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :post_id, :string

      timestamps()
    end
  end
end
