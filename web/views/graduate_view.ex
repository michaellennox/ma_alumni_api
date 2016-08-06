defmodule MaAlumniApi.GraduateView do
  use MaAlumniApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name]
end
