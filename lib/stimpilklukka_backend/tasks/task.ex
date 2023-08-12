defmodule StimpilklukkaBackend.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :task_name, :string
    field :task_description, :string
    field :task_state, :string
    belongs_to :project, StimpilklukkaBackend.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:task_name, :task_description, :task_state, :project_id])
    |> validate_required([:task_name, :task_description, :task_state, :project_id])
  end
end
