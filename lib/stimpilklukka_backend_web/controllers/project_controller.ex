defmodule StimpilklukkaBackendWeb.ProjectController do
  use StimpilklukkaBackendWeb, :controller

  alias StimpilklukkaBackend.Projects
  alias StimpilklukkaBackend.Projects.Project

  import StimpilklukkaBackendWeb.UserAuth

  plug :require_project_ownership when action in [:show, :delete, :edit, :update]

  def index(conn, _params) do
    user_id = conn.assigns.current_user.id
    projects = Projects.list_projects_by_user(user_id)
    render(conn, :index, projects: projects, user_id: user_id)
  end

  def new(conn, _params) do
    changeset = Projects.change_project(%Project{})
    render(conn, :new, changeset: changeset, user_id: conn.assigns.current_user.id)
  end

  def create(conn, %{"project" => project_params}) do
    case Projects.create_project(conn.assigns.current_user, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset, user_id: conn.assigns.current_user.id)
    end
  end

  def show(conn, %{"project_id" => project_id}) do
    project = Projects.get_project!(project_id)
    render(conn, :show, project: project, user_id: conn.assigns.current_user.id, layout: {StimpilklukkaBackendWeb.Layouts, "project"})
  end

  def edit(conn, %{"project_id" => project_id}) do
    project = Projects.get_project!(project_id)
    changeset = Projects.change_project(project)
    render(conn, :edit, project: project, changeset: changeset, user_id: conn.assigns.current_user.id)
  end

  def update(conn, %{"project_id" => project_id, "project" => project_params}) do
    project = Projects.get_project!(project_id)

    case Projects.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, project: project, changeset: changeset, user_id: conn.assigns.current_user.id)
    end
  end

  def delete(conn, %{"project_id" => project_id}) do
    project = Projects.get_project!(project_id)
    {:ok, _project} = Projects.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: ~p"/projects")
  end
end
