defmodule StimpilklukkaBackend.StimpilklukkaTest do
  use StimpilklukkaBackend.DataCase

  alias StimpilklukkaBackend.Stimpilklukka

  describe "projects" do
    alias StimpilklukkaBackend.Projects.Project

    import StimpilklukkaBackend.StimpilklukkaFixtures

    @invalid_attrs %{project_name: nil, project_description: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Stimpilklukka.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Stimpilklukka.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{project_name: "some project_name", project_description: "some project_description"}

      assert {:ok, %Project{} = project} = Stimpilklukka.create_project(valid_attrs)
      assert project.project_name == "some project_name"
      assert project.project_description == "some project_description"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stimpilklukka.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{project_name: "some updated project_name", project_description: "some updated project_description"}

      assert {:ok, %Project{} = project} = Stimpilklukka.update_project(project, update_attrs)
      assert project.project_name == "some updated project_name"
      assert project.project_description == "some updated project_description"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Stimpilklukka.update_project(project, @invalid_attrs)
      assert project == Stimpilklukka.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Stimpilklukka.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Stimpilklukka.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Stimpilklukka.change_project(project)
    end
  end
end
