defmodule MaAlumniApi.Router do
  use MaAlumniApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MaAlumniApi do
    pipe_through :api
  end
end
