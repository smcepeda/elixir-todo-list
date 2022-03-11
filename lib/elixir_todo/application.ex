defmodule ElixirTodo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirTodo.Repo,
      # Start the Telemetry supervisor
      ElixirTodoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirTodo.PubSub},
      # Start the Endpoint (http/https)
      ElixirTodoWeb.Endpoint
      # Start a worker by calling: ElixirTodo.Worker.start_link(arg)
      # {ElixirTodo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirTodo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirTodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
