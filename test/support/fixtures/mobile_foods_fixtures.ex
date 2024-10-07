defmodule Ftat.MobileFoodsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ftat.MobileFoods` context.
  """

  @doc """
  Generate a facility_permit.
  """
  def facility_permit_fixture(attrs \\ %{}) do
    {:ok, facility_permit} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        blocklot: "some blocklot",
        facility_type: "some facility_type",
        food_items: "some food_items",
        permit: "some permit",
        permit_approved_date: ~D[2024-10-06],
        permit_expiration_date: ~D[2024-10-06],
        permit_status: "some permit_status",
        prior_permit: true
      })
      |> Ftat.MobileFoods.create_facility_permit()

    facility_permit
  end
end
