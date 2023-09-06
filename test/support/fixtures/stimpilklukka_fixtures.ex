defmodule StimpilklukkaBackend.StimpilklukkaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StimpilklukkaBackend.Stimpilklukka` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        project_name: "some project_name",
        project_description: "some project_description"
      })
      |> StimpilklukkaBackend.Projects.create_project()

    project
  end
end
