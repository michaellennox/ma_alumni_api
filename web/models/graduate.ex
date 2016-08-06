defmodule MaAlumniApi.Graduate do
  use MaAlumniApi.Web, :model

  schema "graduates" do
    field :name, :string
    field :gender, :string
    field :age, :integer
    field :cohort, Ecto.Date
    field :years_experience_pre_makers, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :gender, :age, :cohort, :years_experience_pre_makers])
    |> validate_required([:name, :gender, :age, :cohort, :years_experience_pre_makers])
  end
end
