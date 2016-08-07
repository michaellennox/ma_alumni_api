defmodule MaAlumniApi.JobSurvey do
  use MaAlumniApi.Web, :model

  schema "job_surveys" do
    field :employment_type, :string
    field :annual_salary, :integer
    field :day_rate, :integer
    field :additional_benefits, :string
    field :employer_name, :string
    field :employer_employees, :string
    field :job_number, :integer
    field :tech_stack, {:array, :string}
    field :sector, :string
    field :location, :string
    field :job_satisfaction, :integer
    field :additional_comments, :string
    belongs_to :graduate, MaAlumniApi.Graduate

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:employment_type, :annual_salary, :day_rate, :additional_benefits, :employer_name, :employer_employees, :job_number, :tech_stack, :sector, :location, :job_satisfaction, :additional_comments, :graduate_id])
    |> validate_required([:employment_type, :additional_benefits, :employer_name, :employer_employees, :job_number, :tech_stack, :sector, :location, :job_satisfaction, :additional_comments])
  end
end
