defmodule StimpilklukkaBackendWeb.TimeEntryController do
  use StimpilklukkaBackendWeb, :controller

  alias StimpilklukkaBackend.TimeEntries

  def index(conn, params) do
     project_id = params["project_id"]
     time_entries = TimeEntries.list_time_entries_by_projectid(project_id)
     render(conn, :index, time_entries: time_entries)
  end
end
