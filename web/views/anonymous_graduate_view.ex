defmodule MaAlumniApi.AnonymousGraduateView do
  use MaAlumniApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:gender, :age, :cohort, :years_experience_pre_makers]
end
