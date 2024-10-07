defmodule Ftat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FtatWeb.Telemetry,
      Ftat.Repo,
      {DNSCluster, query: Application.get_env(:ftat, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ftat.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Ftat.Finch},
      # Start a worker by calling: Ftat.Worker.start_link(arg)
      # {Ftat.Worker, arg},
      # Start to serve requests, typically the last entry
      FtatWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ftat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FtatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
