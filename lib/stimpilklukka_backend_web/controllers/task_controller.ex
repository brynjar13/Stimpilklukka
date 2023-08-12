defmodule StimpilklukkaBackendWeb.TaskController do
  use StimpilklukkaBackendWeb, :controller

  alias StimpilklukkaBackend.Tasks

  def index(conn, params) do
     tasks = Tasks.list_tasks_by_projectid(params.project_id)
     render(conn, :index, tasks: tasks)
  end
end
