defmodule Promotions.Repo.Migrations.CreateActionTypeEnum do
  use Ecto.Migration

  def up do
    execute("""
    CREATE TYPE action_type AS ENUM (
      'account_registration',
      'payment_deposit',
      'sportsbook_bet',
      'casino_wager'
    );
    """)
  end

  def down do
    execute("DROP TYPE action_type;")
  end
end
