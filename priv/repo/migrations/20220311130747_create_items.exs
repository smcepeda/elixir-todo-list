defmodule ElixirTodo.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :content, :string
      add :completed_at, :utc_datetime

      timestamps()
    end
  end
end
