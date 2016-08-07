defmodule MaAlumniApi.JobSurveyView do
  use MaAlumniApi.Web, :view
  use JaSerializer.PhoenixView

  alias MaAlumniApi.Repo

  attributes [:employment_type, :annual_salary, :day_rate, :additional_benefits, :employer_name, :employer_employees, :job_number, :sector, :location, :job_satisfaction, :additional_comments, :inserted_at, :updated_at]

  has_one :graduate,
    field: :graduate,
    type: "graduate",
    serializer: MaAlumniApi.AnonymousGraduateView,
    include: true

  def graduate(struct, _conn) do
    case struct.graduate do
      %Ecto.Association.NotLoaded{} ->
        struct
        |> Ecto.assoc(:graduate)
        |> Repo.all
      other -> other
    end
  end
end
