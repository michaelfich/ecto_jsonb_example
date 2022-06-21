defmodule Promotions.UserAction.SportsbookBetLegAttributes do
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :event_id, :string
    field :event_type, Ecto.Enum, values: [:standard, :special]
    field :market_id, :string
    field :market_selection_id, :string
    field :market_type, Ecto.Enum, values: [:moneyline, :spread, :total]
    field :in_play, :boolean
    field :odds, :integer
  end
end
