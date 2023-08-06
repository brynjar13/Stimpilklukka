defmodule StimpilklukkaBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StimpilklukkaBackendWeb.Telemetry,
      # Start the Ecto repository
      StimpilklukkaBackend.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StimpilklukkaBackend.PubSub},
      # Start Finch
      {Finch, name: StimpilklukkaBackend.Finch},
      # Start the Endpoint (http/https)
      StimpilklukkaBackendWeb.Endpoint
      # Start a worker by calling: StimpilklukkaBackend.Worker.start_link(arg)
      # {StimpilklukkaBackend.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StimpilklukkaBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StimpilklukkaBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
