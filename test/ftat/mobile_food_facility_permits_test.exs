defmodule Ftat.MobileFoodFacilityPermitsTest do
  use Ftat.DataCase

  alias Ftat.MobileFoodFacilityPermits

  describe "mobile_food_facility_permits" do
    alias Ftat.MobileFoodFacilityPermits.MobileFoodFacilityPermit

    import Ftat.MobileFoodFacilityPermitsFixtures

    @invalid_attrs %{
      address: nil,
      permit: nil,
      applicant: nil,
      facility_type: nil,
      blocklot: nil,
      permit_status: nil,
      food_items: nil,
      permit_approved_date: nil,
      permit_expiration_date: nil,
      prior_permit: nil
    }

    test "list_mobile_food_facility_permits/0 returns all mobile_food_facility_permits" do
      mobile_food_facility_permit = mobile_food_facility_permit_fixture()

      assert MobileFoodFacilityPermits.list_mobile_food_facility_permits() == [
               mobile_food_facility_permit
             ]
    end

    test "get_mobile_food_facility_permit!/1 returns the mobile_food_facility_permit with given id" do
      mobile_food_facility_permit = mobile_food_facility_permit_fixture()

      assert MobileFoodFacilityPermits.get_mobile_food_facility_permit!(
               mobile_food_facility_permit.id
             ) == mobile_food_facility_permit
    end

    test "create_mobile_food_facility_permit/1 with valid data creates a mobile_food_facility_permit" do
      valid_attrs = %{
        address: "some address",
        permit: "some permit",
        applicant: "some applicant",
        facility_type: "some facility_type",
        blocklot: "some blocklot",
        permit_status: "some permit_status",
        food_items: "some food_items",
        permit_approved_date: ~D[2024-10-06],
        permit_expiration_date: ~D[2024-10-06],
        prior_permit: true
      }

      assert {:ok, %MobileFoodFacilityPermit{} = mobile_food_facility_permit} =
               MobileFoodFacilityPermits.create_mobile_food_facility_permit(valid_attrs)

      assert mobile_food_facility_permit.address == "some address"
      assert mobile_food_facility_permit.permit == "some permit"
      assert mobile_food_facility_permit.applicant == "some applicant"
      assert mobile_food_facility_permit.facility_type == "some facility_type"
      assert mobile_food_facility_permit.blocklot == "some blocklot"
      assert mobile_food_facility_permit.permit_status == "some permit_status"
      assert mobile_food_facility_permit.food_items == "some food_items"
      assert mobile_food_facility_permit.permit_approved_date == ~D[2024-10-06]
      assert mobile_food_facility_permit.permit_expiration_date == ~D[2024-10-06]
      assert mobile_food_facility_permit.prior_permit == true
    end

    test "create_mobile_food_facility_permit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               MobileFoodFacilityPermits.create_mobile_food_facility_permit(@invalid_attrs)
    end
  end
end
