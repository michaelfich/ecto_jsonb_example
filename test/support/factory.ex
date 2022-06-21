defmodule Promotions.Factory do
  use ExMachina.Ecto, repo: Promotions.Repo

  def sportsbook_bet_user_action_factory do
    %Promotions.UserAction{
      event_id: Faker.UUID.v4(),
      event_type: :sportsbook_bet,
      user_id: Faker.UUID.v4(),
      region: region(),
      occurred_at: Faker.DateTime.backward(30),
      sportsbook_bet_attributes: build(:sportsbook_bet_attributes)
    }
  end

  def sportsbook_bet_attributes_factory do
    %Promotions.UserAction.SportsbookBetAttributes{
      amount_cents_wagered: Faker.random_between(10, 100) * 50,
      amount_cents_payout: Faker.random_between(10, 100) * 50,
      bet_type: Faker.Util.pick([:straight, :parlay]),
      odds: odds(),
      legs: build_list(Faker.random_between(1, 3), :sportsbook_bet_leg_attribtues)
    }
  end

  def sportsbook_bet_leg_attribtues_factory do
    %Promotions.UserAction.SportsbookBetLegAttributes{
      event_id: Faker.UUID.v4(),
      event_type: Faker.Util.pick([:standard, :special]),
      market_id: Faker.UUID.v4(),
      market_selection_id: Faker.UUID.v4(),
      market_type: Faker.Util.pick([:moneyline, :spread, :total]),
      in_play: Faker.Util.pick([true, false]),
      odds: odds()
    }
  end

  defp odds do
    if Faker.Util.pick([true, false]) do
      Faker.random_between(110, 500)
    else
      Faker.random_between(-110, -500)
    end
  end

  defp region do
    Faker.Util.pick([
      :can_ontario,
      :usa_colorado,
      :usa_indiana,
      :usa_iowa,
      :usa_new_jersey
    ])
  end
end
