defmodule StimpilklukkaBackend.Stimpilklukka.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :project_name, :string
    field :project_description, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:project_name, :project_description])
    |> validate_required([:project_name, :project_description])
  end
end
