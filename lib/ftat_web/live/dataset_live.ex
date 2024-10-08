defmodule FtatWeb.DatasetLive do
  use FtatWeb, :live_view

  alias Ftat.MobileFoods

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-2xl mb-4">Dataset</div>
    <div id="tabulator-table" phx-hook="Tabulator" data-tabledata={Jason.encode!(@data)} />
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    data =
      MobileFoods.list_mobile_food_facility_permits()
      |> Enum.map(fn entry ->
        entry
        |> Map.from_struct()
        |> Map.delete(:__meta__)
        |> Map.delete(:id)
        |> Map.delete(:inserted_at)
        |> Map.delete(:updated_at)
      end)

    socket =
      socket
      |> assign(data: data)

    {:ok, socket}
  end
end
