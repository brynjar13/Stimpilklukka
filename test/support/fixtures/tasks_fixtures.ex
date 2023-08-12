defmodule StimpilklukkaBackend.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StimpilklukkaBackend.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        task_name: "some task_name",
        task_description: "some task_description",
        task_state: "some task_state"
      })
      |> StimpilklukkaBackend.Tasks.create_task()

    task
  end
end
