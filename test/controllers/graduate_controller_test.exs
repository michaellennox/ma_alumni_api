defmodule MaAlumniApi.GraduateControllerTest do
  use MaAlumniApi.ConnCase

  alias MaAlumniApi.Graduate
  alias MaAlumniApi.Repo

  @valid_attrs %{age: 42, cohort: %Ecto.Date{day: 17, month: 4, year: 2010}, gender: "some content", name: "some content", years_experience_pre_makers: 42}
  @invalid_attrs %{}

  setup do
    conn = build_conn()
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end

  defp relationships do
    %{}
  end

  test "shows name and id only when requested name", %{conn: conn} do
    graduate = Repo.insert! struct(Graduate, @valid_attrs)
    conn = get conn, graduate_path(conn, :show, graduate.name)
    data = json_response(conn, 200)["data"]
    assert data["id"] == "#{graduate.id}"
    assert data["type"] == "graduate"
    assert data["attributes"]["name"] == graduate.name
    assert data["attributes"]["gender"] == nil
    assert data["attributes"]["age"] == nil
    assert data["attributes"]["cohort"] == nil
    assert data["attributes"]["years_experience_pre_makers"] == nil
  end

  test "does not show resource and instead throw error when name is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, graduate_path(conn, :show, "random name")
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, graduate_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "graduate",
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Graduate, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, graduate_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "graduate",
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end
end
