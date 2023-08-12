defmodule StimpilklukkaBackend.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :task_name, :string
      add :task_description, :string
      add :task_state, :string
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:project_id])
  end
end
