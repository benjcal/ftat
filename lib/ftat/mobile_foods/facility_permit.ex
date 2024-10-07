defmodule Ftat.MobileFoods.FacilityPermit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mobile_food_facility_permits" do
    field :address, :string
    field :permit, :string
    field :applicant, :string
    field :facility_type, :string
    field :blocklot, :string
    field :permit_status, :string
    field :food_items, :string
    field :permit_approved_date, :date
    field :permit_expiration_date, :date
    field :prior_permit, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(facility_permit, attrs) do
    facility_permit
    |> cast(attrs, [
      :applicant,
      :address,
      :facility_type,
      :blocklot,
      :permit,
      :permit_status,
      :food_items,
      :permit_approved_date,
      :permit_expiration_date,
      :prior_permit
    ])
    |> validate_required([:applicant, :facility_type, :permit, :permit_status])
  end
end
