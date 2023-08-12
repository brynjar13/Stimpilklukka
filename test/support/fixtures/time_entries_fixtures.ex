defmodule StimpilklukkaBackend.TimeEntriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StimpilklukkaBackend.TimeEntries` context.
  """

  @doc """
  Generate a time_entry.
  """
  def time_entry_fixture(attrs \\ %{}) do
    {:ok, time_entry} =
      attrs
      |> Enum.into(%{
        clock_in_time: ~D[2023-08-11],
        clock_out_time: ~D[2023-08-11]
      })
      |> StimpilklukkaBackend.TimeEntries.create_time_entry()

    time_entry
  end
end
