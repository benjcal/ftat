defmodule FtatWeb.FacilitiesLive do
  alias Ftat.MobileFoods
  use FtatWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-2xl mb-4">Facility Types</div>

    <div class="grid grid-cols-2 gap-8">
      <div>
        <%!-- <div class="text-xl font-bold">Types</div> --%>
        <div id="type-count-chart" phx-hook="BarChart" data-chartdata={Jason.encode!(@type_count)}>
        </div>
      </div>

      <div class="col-start-1">
        <div class="text-xl font-bold">Food Truck Permits Status</div>
        <div
          id="truck-status-chart"
          phx-hook="DonutChart"
          data-labels={Jason.encode!(@truck_status_labels)}
          data-chartdata={Jason.encode!(@truck_status_count)}
        >
        </div>
      </div>

      <div>
        <div class="text-xl font-bold">Push Cart Permits Status</div>
        <div
          id="cart-status-chart"
          phx-hook="DonutChart"
          data-labels={Jason.encode!(@cart_status_labels)}
          data-chartdata={Jason.encode!(@cart_status_count)}
        >
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    type_count =
      MobileFoods.get_facility_types_count()
      |> Enum.map(fn {type, count} -> %{x: type, y: count} end)

    truck_status =
      MobileFoods.get_facility_permit_status_count_by_type("Truck")

    truck_status_labels =
      truck_status
      |> Enum.map(fn {status, _} -> status end)

    truck_status_count =
      truck_status
      |> Enum.map(fn {_, count} -> count end)

    cart_status =
      MobileFoods.get_facility_permit_status_count_by_type("Push Cart")

    cart_status_labels =
      cart_status
      |> Enum.map(fn {status, _} -> status end)

    cart_status_count =
      cart_status
      |> Enum.map(fn {_, count} -> count end)

    # [truck_new] = MobileFoods.get_facility_permit_new_by_type("Truck")

    # [cart_new] = MobileFoods.get_facility_permit_new_by_type("Push Cart")

    socket =
      socket
      |> assign(type_count: type_count)
      |> assign(truck_status_labels: truck_status_labels)
      |> assign(truck_status_count: truck_status_count)
      |> assign(cart_status_labels: cart_status_labels)
      |> assign(cart_status_count: cart_status_count)
      |> assign(cart_count: cart_status)

    {:ok, socket}
  end
end
