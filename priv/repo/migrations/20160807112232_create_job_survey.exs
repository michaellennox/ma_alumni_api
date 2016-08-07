defmodule MaAlumniApi.Repo.Migrations.CreateJobSurvey do
  use Ecto.Migration

  def change do
    create table(:job_surveys) do
      add :employment_type, :string
      add :annual_salary, :integer
      add :day_rate, :integer
      add :additional_benefits, :text
      add :employer_name, :string
      add :employer_employees, :string
      add :job_number, :integer
      add :tech_stack, {:array, :string}
      add :sector, :string
      add :location, :string
      add :job_satisfaction, :integer
      add :additional_comments, :text
      add :graduate_id, references(:graduates, on_delete: :nothing)

      timestamps()
    end
    create index(:job_surveys, [:graduate_id])

  end
end
