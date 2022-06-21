import Config

config :promotions_blog_demo,
  ecto_repos: [Promotions.Repo]

config :promotions_blog_demo, Promotions.Repo,
  database: "promotions_blog_demo",
  username: "",
  password: "",
  hostname: "localhost"
