defmodule Ftat.MobileFoodsTest do
  use Ftat.DataCase

  alias Ftat.MobileFoods

  describe "mobile_food_facility_permits" do
    alias Ftat.MobileFoods.FacilityPermit

    import Ftat.MobileFoodsFixtures

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
      facility_permit = facility_permit_fixture()
      assert MobileFoods.list_mobile_food_facility_permits() == [facility_permit]
    end

    test "get_facility_permit!/1 returns the facility_permit with given id" do
      facility_permit = facility_permit_fixture()
      assert MobileFoods.get_facility_permit!(facility_permit.id) == facility_permit
    end

    test "create_facility_permit/1 with valid data creates a facility_permit" do
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

      assert {:ok, %FacilityPermit{} = facility_permit} =
               MobileFoods.create_facility_permit(valid_attrs)

      assert facility_permit.address == "some address"
      assert facility_permit.permit == "some permit"
      assert facility_permit.applicant == "some applicant"
      assert facility_permit.facility_type == "some facility_type"
      assert facility_permit.blocklot == "some blocklot"
      assert facility_permit.permit_status == "some permit_status"
      assert facility_permit.food_items == "some food_items"
      assert facility_permit.permit_approved_date == ~D[2024-10-06]
      assert facility_permit.permit_expiration_date == ~D[2024-10-06]
      assert facility_permit.prior_permit == true
    end

    test "create_facility_permit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MobileFoods.create_facility_permit(@invalid_attrs)
    end
  end
end
