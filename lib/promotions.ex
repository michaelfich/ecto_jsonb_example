defmodule Promotions do
  import Ecto.Query

  def sportsbook_bet_query(user_id, region, amount_cents, event_ids) do
    from action in Promotions.UserAction,
      as: :user_action,
      where: action.user_id == ^user_id,
      where: action.region == ^region,
      where:
        fragment("(?->?)::integer", action.sportsbook_bet_attributes, "amount_cents_wagered") >=
          ^amount_cents,
      where:
        not exists(
          from [
                 leg_user_action: action_subquery,
                 sportsbook_bet_legs: sportsbook_bet_legs
               ] in event_ids_query(),
               where: parent_as(:user_action).id == action_subquery.id,
               where: sportsbook_bet_legs.event_id in ^event_ids
        )
  end

  def event_ids_query do
    from action in Promotions.UserAction,
      as: :leg_user_action,
      inner_lateral_join:
        legs in fragment(
          "(SELECT * FROM jsonb_to_recordset(?->?) AS record(event_id varchar))",
          action.sportsbook_bet_attributes,
          "legs"
        ),
      as: :sportsbook_bet_legs,
      on: true
  end
end
