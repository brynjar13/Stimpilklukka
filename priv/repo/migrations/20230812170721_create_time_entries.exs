defmodule StimpilklukkaBackend.Repo.Migrations.CreateTimeEntries do
  use Ecto.Migration

  def change do
    create table(:time_entries) do
      add :clock_in_time, :date
      add :clock_out_time, :date
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:time_entries, [:project_id])
  end
end
