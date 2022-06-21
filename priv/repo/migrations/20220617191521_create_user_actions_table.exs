defmodule Promotions.Repo.Migrations.CreateUserActionsTable do
  use Ecto.Migration

  def change do
    create table(:user_actions) do
      add :event_id, :string, null: false
      add :event_type, :action_type, null: false
      add :user_id, :binary_id, null: false
      add :region, :region, null: false
      add :occurred_at, :utc_datetime_usec, null: false
      add :attributes, :jsonb, null: false

      timestamps()
    end
  end
end
