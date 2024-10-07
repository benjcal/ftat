defmodule Ftat.Data.Init do
  import Ftat.MobileFoods

  @mobile_food_facility_permits_from_csv "data/Mobile_Food_Facility_Permit_20241007.csv"

  def init_data() do
    insert_mobile_food_facility_permits_from_csv(@mobile_food_facility_permits_from_csv)
  end

  defp insert_mobile_food_facility_permits_from_csv(file) do
    File.stream!(file)
    |> CSV.decode!(headers: true)
    |> Enum.map(fn entry ->
      approved_date = parse_csv_date(entry["Approved"])
      expiration_date = parse_csv_date(entry["ExpirationDate"])

      %{
        applicant: entry["Applicant"],
        address: entry["Address"],
        facility_type: entry["FacilityType"],
        blocklot: entry["blocklot"],
        permit: entry["permit"],
        permit_status: entry["Status"],
        food_items: entry["FoodItems"],
        permit_approved_date: approved_date,
        permit_expiration_date: expiration_date,
        prior_permit: entry["PriorPermit"]
      }
    end)
    |> Enum.map(&create_facility_permit(&1))
  end

  defp parse_csv_date(str) do
    case str do
      "" ->
        nil

      val ->
        val
        |> DateTimeParser.parse!()
        |> NaiveDateTime.to_date()
    end
  end
end
