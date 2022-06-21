defmodule Promotions.ActionType do
  def values do
    [
      :account_registration,
      :payment_deposit,
      :sportsbook_bet,
      :casino_wager
    ]
  end
end
