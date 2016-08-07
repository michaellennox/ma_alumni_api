defmodule MaAlumniApi.JobSurveyController do
  use MaAlumniApi.Web, :controller

  alias MaAlumniApi.JobSurvey
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    job_surveys = Repo.all(JobSurvey)
    render(conn, "index.json-api", data: job_surveys)
  end

  def create(conn, %{"data" => data = %{"type" => "job_survey", "attributes" => _job_survey_params}}) do
    changeset = JobSurvey.changeset(%JobSurvey{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, job_survey} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", job_survey_path(conn, :show, job_survey))
        |> render("show.json-api", data: job_survey)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MaAlumniApi.ChangesetView, "error.json-api", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job_survey = Repo.get!(JobSurvey, id)
    render(conn, "show.json-api", data: job_survey)
  end
end
