defmodule Promotions.UserAction do
  use Ecto.Schema

  schema "user_actions" do
    field :event_id, :string
    field :event_type, Ecto.Enum, values: Promotions.ActionType.values()
    field :user_id, Ecto.UUID
    field :region, Ecto.Enum, values: Promotions.Region.values()
    field :occurred_at, :utc_datetime_usec

    embeds_one :sportsbook_bet_attributes, Promotions.UserAction.SportsbookBetAttributes,
      source: :attributes,
      on_replace: :update

    timestamps()
  end
end
