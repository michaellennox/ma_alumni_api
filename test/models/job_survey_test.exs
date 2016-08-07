defmodule MaAlumniApi.JobSurveyTest do
  use MaAlumniApi.ModelCase

  alias MaAlumniApi.JobSurvey

  @valid_attrs %{additional_benefits: "some content", additional_comments: "some content", annual_salary: 35000, employer_employees: "some content", employer_name: "some content", employment_type: "some content", job_number: 3, job_satisfaction: 9, location: "some content", sector: "some content", tech_stack: ["ruby", "javascript"]}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = JobSurvey.changeset(%JobSurvey{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = JobSurvey.changeset(%JobSurvey{}, @invalid_attrs)
    refute changeset.valid?
  end
end
