defmodule StimpilklukkaBackend.TimeEntries.TimeEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "time_entries" do
    field :clock_in_time, :date
    field :clock_out_time, :date
    belongs_to :project, StimpilklukkaBackend.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(time_entry, attrs) do
    time_entry
    |> cast(attrs, [:clock_in_time, :clock_out_time, :project_id])
    |> validate_required([:clock_in_time, :clock_out_time, :project_id])
  end
end
