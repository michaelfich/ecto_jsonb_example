defmodule Promotions.UserAction.SportsbookBetAttributes do
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :amount_cents_wagered, :integer
    field :amount_cents_payout, :integer
    field :bet_type, Ecto.Enum, values: [:straight, :parlay]
    field :odds, :integer

    embeds_many :legs, Promotions.UserAction.SportsbookBetLegAttributes
  end
end
