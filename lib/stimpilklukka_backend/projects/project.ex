defmodule StimpilklukkaBackend.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :project_name, :string
    field :project_description, :string
    belongs_to :user, StimpilklukkaBackend.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:project_name, :project_description, :user_id])
    |> validate_required([:project_name, :project_description, :user_id])
  end
end
