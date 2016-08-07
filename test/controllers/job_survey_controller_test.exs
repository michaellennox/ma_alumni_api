defmodule MaAlumniApi.JobSurveyControllerTest do
  use MaAlumniApi.ConnCase

  alias MaAlumniApi.JobSurvey
  alias MaAlumniApi.Repo

  @valid_attrs %{additional_benefits: "some content", additional_comments: "some content", day_rate: 350, employer_employees: "some content", employer_name: "some content", employment_type: "some content", job_number: 1, job_satisfaction: 7, location: "some content", sector: "some content", tech_stack: []}
  @invalid_attrs %{}

  setup do
    conn = build_conn()
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end

  defp relationships do
    graduate = Repo.insert!(%MaAlumniApi.Graduate{})

    %{
      "graduate" => %{
        "data" => %{
          "type" => "graduate",
          "id" => graduate.id
        }
      },
    }
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, job_survey_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    job_survey = Repo.insert! %JobSurvey{}
    conn = get conn, job_survey_path(conn, :show, job_survey)
    data = json_response(conn, 200)["data"]
    assert data["id"] == "#{job_survey.id}"
    assert data["type"] == "job-survey"
    assert data["attributes"]["employment_type"] == job_survey.employment_type
    assert data["attributes"]["annual_salary"] == job_survey.annual_salary
    assert data["attributes"]["day_rate"] == job_survey.day_rate
    assert data["attributes"]["additional_benefits"] == job_survey.additional_benefits
    assert data["attributes"]["employer_name"] == job_survey.employer_name
    assert data["attributes"]["employer_employees"] == job_survey.employer_employees
    assert data["attributes"]["job_number"] == job_survey.job_number
    assert data["attributes"]["tech_stack"] == job_survey.tech_stack
    assert data["attributes"]["sector"] == job_survey.sector
    assert data["attributes"]["location"] == job_survey.location
    assert data["attributes"]["job_satisfaction"] == job_survey.job_satisfaction
    assert data["attributes"]["additional_comments"] == job_survey.additional_comments
    assert data["attributes"]["graduate_id"] == job_survey.graduate_id
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, job_survey_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, job_survey_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "job_survey",
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(JobSurvey, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, job_survey_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "job_survey",
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end
end
