defmodule StimpilklukkaBackend.TimeEntriesTest do
  use StimpilklukkaBackend.DataCase

  alias StimpilklukkaBackend.TimeEntries

  describe "time_entries" do
    alias StimpilklukkaBackend.TimeEntries.TimeEntry

    import StimpilklukkaBackend.TimeEntriesFixtures

    @invalid_attrs %{clock_in_time: nil, clock_out_time: nil}

    test "list_time_entries/0 returns all time_entries" do
      time_entry = time_entry_fixture()
      assert TimeEntries.list_time_entries() == [time_entry]
    end

    test "get_time_entry!/1 returns the time_entry with given id" do
      time_entry = time_entry_fixture()
      assert TimeEntries.get_time_entry!(time_entry.id) == time_entry
    end

    test "create_time_entry/1 with valid data creates a time_entry" do
      valid_attrs = %{clock_in_time: ~D[2023-08-11], clock_out_time: ~D[2023-08-11]}

      assert {:ok, %TimeEntry{} = time_entry} = TimeEntries.create_time_entry(valid_attrs)
      assert time_entry.clock_in_time == ~D[2023-08-11]
      assert time_entry.clock_out_time == ~D[2023-08-11]
    end

    test "create_time_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeEntries.create_time_entry(@invalid_attrs)
    end

    test "update_time_entry/2 with valid data updates the time_entry" do
      time_entry = time_entry_fixture()
      update_attrs = %{clock_in_time: ~D[2023-08-12], clock_out_time: ~D[2023-08-12]}

      assert {:ok, %TimeEntry{} = time_entry} = TimeEntries.update_time_entry(time_entry, update_attrs)
      assert time_entry.clock_in_time == ~D[2023-08-12]
      assert time_entry.clock_out_time == ~D[2023-08-12]
    end

    test "update_time_entry/2 with invalid data returns error changeset" do
      time_entry = time_entry_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeEntries.update_time_entry(time_entry, @invalid_attrs)
      assert time_entry == TimeEntries.get_time_entry!(time_entry.id)
    end

    test "delete_time_entry/1 deletes the time_entry" do
      time_entry = time_entry_fixture()
      assert {:ok, %TimeEntry{}} = TimeEntries.delete_time_entry(time_entry)
      assert_raise Ecto.NoResultsError, fn -> TimeEntries.get_time_entry!(time_entry.id) end
    end

    test "change_time_entry/1 returns a time_entry changeset" do
      time_entry = time_entry_fixture()
      assert %Ecto.Changeset{} = TimeEntries.change_time_entry(time_entry)
    end
  end
end
