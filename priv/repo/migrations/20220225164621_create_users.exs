defmodule BlogTest.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :username, :string, null: false
      add :password_hash, :string, redact: true

      timestamps()
    end

    create unique_index(:users, [:email, :username])
  end
end
