defmodule Ftat.Repo.Migrations.CreateMobileFoodFacilityPermits do
  use Ecto.Migration

  def change do
    create table(:mobile_food_facility_permits) do
      add :applicant, :string
      add :address, :string
      add :facility_type, :string
      add :blocklot, :string
      add :permit, :string
      add :permit_status, :string
      add :food_items, :string
      add :permit_approved_date, :date
      add :permit_expiration_date, :date
      add :prior_permit, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
