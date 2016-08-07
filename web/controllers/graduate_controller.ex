defmodule MaAlumniApi.GraduateController do
  use MaAlumniApi.Web, :controller

  alias MaAlumniApi.Graduate
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def create(conn, %{"data" => data = %{"type" => "graduate", "attributes" => _graduate_params}}) do
    changeset = Graduate.changeset(%Graduate{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, graduate} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", graduate_path(conn, :show, graduate))
        |> render("show.json-api", data: graduate)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MaAlumniApi.ChangesetView, "error.json-api", changeset: changeset)
    end
  end

  def show(conn, %{"name" => name}) do
    graduate = Repo.get_by!(Graduate, name: name)
    render(conn, "show.json-api", data: graduate)
  end
end
