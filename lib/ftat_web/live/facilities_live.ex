defmodule FtatWeb.FacilitiesLive do
  use FtatWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    facilities
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
