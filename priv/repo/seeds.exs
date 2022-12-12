# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Rumbl.Repo
alias Rumbl.Accounts.User
Repo.insert!(%User{
  name: "José", username: "josevalim"
}, on_conflict: :nothing)

Repo.insert!(%User{
  name: "Bruce", username: "redrapids"
}, on_conflict: :nothing)

Repo.insert!(%User{
  name: "Chris", username: "mccord"
}, on_conflict: :nothing)

for u <- Repo.all(User) do
  Repo.update!(User.registration_changeset(u, %{password: "temppass"}))
end

alias Rumbl.Multimedia
for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Multimedia.create_category!(category)
end
