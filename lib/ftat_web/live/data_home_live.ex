defmodule FtatWeb.DataHomeLive do
  use FtatWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-4xl font-bold">Welcome to F.T.A.T (Food Truck Analysis Toolkit)</div>
    <div class="grid grid-cols-2 gap-8 max-w-2xl mx-auto">
      <.link href="/dataset">
        <div class="flex justify-center items-center h-24 border rounded-xl hover:bg-gray-100 gap-2">
          <.icon name="hero-table-cells" />
          <span>Dataset</span>
        </div>
      </.link>

      <.link href="/facilities">
        <div class="flex justify-center items-center h-24 border rounded-xl hover:bg-gray-100 gap-2">
          <.icon name="hero-building-storefront" />
          <span>Facility Types</span>
        </div>
      </.link>

      <.link href="/names">
        <div class="flex justify-center items-center h-24 border rounded-xl hover:bg-gray-100 gap-2">
          <.icon name="hero-document-text" />
          <span>Name Analysis</span>
        </div>
      </.link>

      <.link href="/permits">
        <div class="flex justify-center items-center h-24 border rounded-xl hover:bg-gray-100 gap-2">
          <.icon name="hero-calendar-days" />
          <span>Permit Dates Analysis</span>
        </div>
      </.link>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
