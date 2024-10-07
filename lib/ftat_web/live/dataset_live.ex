defmodule FtatWeb.DatasetLive do
  use FtatWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    dataset
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
