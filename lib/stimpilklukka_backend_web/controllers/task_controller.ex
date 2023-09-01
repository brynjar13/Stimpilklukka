defmodule StimpilklukkaBackendWeb.TaskController do
  use StimpilklukkaBackendWeb, :controller

  alias StimpilklukkaBackend.Tasks

  def index(conn, params) do
    project_id = params["project_id"]
    tasks = Tasks.list_tasks_by_projectid(project_id)
    render(conn, :index, tasks: tasks)
  end
end
