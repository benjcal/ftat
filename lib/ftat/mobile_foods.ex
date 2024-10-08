defmodule Ftat.MobileFoods do
  @moduledoc """
  The MobileFoods context.
  """

  import Ecto.Query, warn: false
  alias Ftat.Repo

  alias Ftat.MobileFoods.FacilityPermit

  @doc """
  Returns the list of mobile_food_facility_permits.

  ## Examples

      iex> list_mobile_food_facility_permits()
      [%FacilityPermit{}, ...]

  """
  def list_mobile_food_facility_permits do
    Repo.all(FacilityPermit)
  end

  @doc """
  Gets a single facility_permit.

  Raises `Ecto.NoResultsError` if the Facility permit does not exist.

  ## Examples

      iex> get_facility_permit!(123)
      %FacilityPermit{}

      iex> get_facility_permit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_facility_permit!(id), do: Repo.get!(FacilityPermit, id)

  @doc """
  Creates a facility_permit.

  ## Examples

      iex> create_facility_permit(%{field: value})
      {:ok, %FacilityPermit{}}

      iex> create_facility_permit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_facility_permit(attrs \\ %{}) do
    %FacilityPermit{}
    |> FacilityPermit.changeset(attrs)
    |> Repo.insert()
  end

  def get_facility_types_count() do
    query =
      from fp in FacilityPermit,
        group_by: :facility_type,
        select: {fp.facility_type, count(fp.id)}

    query
    |> Repo.all()
  end

  def get_facility_permit_status_count do
    query =
      from fp in FacilityPermit,
        group_by: :permit_status,
        select: {fp.permit_status, count(fp.id)}

    query
    |> Repo.all()
  end

  def get_facility_permit_status_count_by_type(type) do
    query =
      from fp in FacilityPermit,
        group_by: :permit_status,
        select: {fp.permit_status, count(fp.id)},
        where: fp.facility_type == ^type

    query
    |> Repo.all()
  end

  def get_facility_permit_new_by_type(type) do
    query =
      from fp in FacilityPermit,
        select: count(fp.id),
        where: fp.facility_type == ^type,
        where: fp.prior_permit == false,
        where: fp.permit_status == "APPROVED"

    query
    |> Repo.all()
  end
end
