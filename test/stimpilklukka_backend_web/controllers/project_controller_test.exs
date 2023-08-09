defmodule StimpilklukkaBackendWeb.ProjectControllerTest do
  use StimpilklukkaBackendWeb.ConnCase

  import StimpilklukkaBackend.StimpilklukkaFixtures

  @create_attrs %{project_name: "some project_name", project_description: "some project_description"}
  @update_attrs %{project_name: "some updated project_name", project_description: "some updated project_description"}
  @invalid_attrs %{project_name: nil, project_description: nil}

  describe "index" do
    test "lists all projects", %{conn: conn} do
      conn = get(conn, ~p"/user/:user_id/projects")
      assert html_response(conn, 200) =~ "Listing Projects"
    end
  end

  describe "new project" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/user/:user_id/projects/new")
      assert html_response(conn, 200) =~ "New Project"
    end
  end

  describe "create project" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/user/:user_id/projects", project: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/user/:user_id/projects/#{id}"

      conn = get(conn, ~p"/user/:user_id/projects/#{id}")
      assert html_response(conn, 200) =~ "Project #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/user/:user_id/projects", project: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Project"
    end
  end

  describe "edit project" do
    setup [:create_project]

    test "renders form for editing chosen project", %{conn: conn, project: project} do
      conn = get(conn, ~p"/user/:user_id/projects/#{project}/edit")
      assert html_response(conn, 200) =~ "Edit Project"
    end
  end

  describe "update project" do
    setup [:create_project]

    test "redirects when data is valid", %{conn: conn, project: project} do
      conn = put(conn, ~p"/user/:user_id/projects/#{project}", project: @update_attrs)
      assert redirected_to(conn) == ~p"/user/:user_id/projects/#{project}"

      conn = get(conn, ~p"/user/:user_id/projects/#{project}")
      assert html_response(conn, 200) =~ "some updated project_name"
    end

    test "renders errors when data is invalid", %{conn: conn, project: project} do
      conn = put(conn, ~p"/user/:user_id/projects/#{project}", project: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Project"
    end
  end

  describe "delete project" do
    setup [:create_project]

    test "deletes chosen project", %{conn: conn, project: project} do
      conn = delete(conn, ~p"/user/:user_id/projects/#{project}")
      assert redirected_to(conn) == ~p"/user/:user_id/projects"

      assert_error_sent 404, fn ->
        get(conn, ~p"/user/:user_id/projects/#{project}")
      end
    end
  end

  defp create_project(_) do
    project = project_fixture()
    %{project: project}
  end
end
