defmodule Promotions.Repo.Migrations.CreateRegionEnum do
  use Ecto.Migration

  def up do
    execute("""
    CREATE TYPE region AS ENUM (
      'can_ontario',
      'usa_colorado',
      'usa_indiana',
      'usa_iowa',
      'usa_new_jersey'
    );
    """)
  end

  def down do
    execute("DROP TYPE region;")
  end
end
