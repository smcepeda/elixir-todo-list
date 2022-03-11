defmodule ElixirTodo.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirTodo.Todos` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        completed_at: ~U[2022-03-10 13:07:00Z],
        content: "some content"
      })
      |> ElixirTodo.Todos.create_item()

    item
  end
end
