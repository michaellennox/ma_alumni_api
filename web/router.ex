defmodule MaAlumniApi.Router do
  use MaAlumniApi.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/", MaAlumniApi do
    pipe_through :api

    resources "/graduates", GraduateController, only: [:create, :show], param: "name"
    resources "/job_surveys", JobSurveyController, only: [:index, :create, :show]
  end
end
