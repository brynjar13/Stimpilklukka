defmodule StimpilklukkaBackend.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :project_name, :string
      add :project_description, :string
      add :user_id, references(:users, on_delete: :delete_all, null: false)

      timestamps()
    end

    create index(:projects, [:user_id])
  end
end
