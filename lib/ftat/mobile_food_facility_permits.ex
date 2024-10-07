defmodule Ftat.MobileFoodFacilityPermits do
  @moduledoc """
  The MobileFoodFacilityPermits context.
  """

  import Ecto.Query, warn: false
  alias Ftat.Repo

  alias Ftat.MobileFoodFacilityPermits.MobileFoodFacilityPermit

  @doc """
  Returns the list of mobile_food_facility_permits.

  ## Examples

      iex> list_mobile_food_facility_permits()
      [%MobileFoodFacilityPermit{}, ...]

  """
  def list_mobile_food_facility_permits do
    Repo.all(MobileFoodFacilityPermit)
  end

  @doc """
  Gets a single mobile_food_facility_permit.

  Raises `Ecto.NoResultsError` if the Mobile food facility permit does not exist.

  ## Examples

      iex> get_mobile_food_facility_permit!(123)
      %MobileFoodFacilityPermit{}

      iex> get_mobile_food_facility_permit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mobile_food_facility_permit!(id), do: Repo.get!(MobileFoodFacilityPermit, id)

  @doc """
  Creates a mobile_food_facility_permit.

  ## Examples

      iex> create_mobile_food_facility_permit(%{field: value})
      {:ok, %MobileFoodFacilityPermit{}}

      iex> create_mobile_food_facility_permit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mobile_food_facility_permit(attrs \\ %{}) do
    %MobileFoodFacilityPermit{}
    |> MobileFoodFacilityPermit.changeset(attrs)
    |> Repo.insert()
  end
end
