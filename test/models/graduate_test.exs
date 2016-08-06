defmodule MaAlumniApi.GraduateTest do
  use MaAlumniApi.ModelCase

  alias MaAlumniApi.Graduate

  @valid_attrs %{age: 42, cohort: %{day: 17, month: 4, year: 2010}, gender: "some content", name: "some content", years_experience_pre_makers: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Graduate.changeset(%Graduate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Graduate.changeset(%Graduate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
