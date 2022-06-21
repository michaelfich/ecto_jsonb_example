defmodule Promotions.Repo do
  use Ecto.Repo,
    otp_app: :promotions_blog_demo,
    adapter: Ecto.Adapters.Postgres
end
