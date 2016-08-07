defmodule MaAlumniApi.Repo.Migrations.CreateGraduate do
  use Ecto.Migration

  def change do
    create table(:graduates) do
      add :name, :string
      add :gender, :string
      add :age, :integer
      add :cohort, :date
      add :years_experience_pre_makers, :integer

      timestamps()
    end

  end
end
