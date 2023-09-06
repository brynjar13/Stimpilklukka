defmodule StimpilklukkaBackendWeb.TaskController do
  use StimpilklukkaBackendWeb, :controller

  alias StimpilklukkaBackend.Tasks
  alias StimpilklukkaBackend.Projects

  def index(conn, params) do
    project_id = params["project_id"]
    project = Projects.get_project!(project_id)
    tasks = Tasks.list_tasks_by_projectid(project_id)
    render(conn, :index, tasks: tasks, project: project, layout: {StimpilklukkaBackendWeb.Layouts, "project"})
  end
end
