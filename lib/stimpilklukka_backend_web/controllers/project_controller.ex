defmodule StimpilklukkaBackendWeb.ProjectController do
  use StimpilklukkaBackendWeb, :controller

  alias StimpilklukkaBackend.Stimpilklukka
  alias StimpilklukkaBackend.Stimpilklukka.Project

  def index(conn, _params) do
    projects = Stimpilklukka.list_projects()
    render(conn, :index, projects: projects)
  end

  def new(conn, _params) do
    changeset = Stimpilklukka.change_project(%Project{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"project" => project_params}) do
    case Stimpilklukka.create_project(project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Stimpilklukka.get_project!(id)
    render(conn, :show, project: project)
  end

  def edit(conn, %{"id" => id}) do
    project = Stimpilklukka.get_project!(id)
    changeset = Stimpilklukka.change_project(project)
    render(conn, :edit, project: project, changeset: changeset)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Stimpilklukka.get_project!(id)

    case Stimpilklukka.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: ~p"/projects/#{project}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, project: project, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Stimpilklukka.get_project!(id)
    {:ok, _project} = Stimpilklukka.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: ~p"/projects")
  end
end
