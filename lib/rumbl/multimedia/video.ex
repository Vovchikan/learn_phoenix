defmodule Rumbl.Multimedia.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :desctiption, :string
    field :title, :string
    field :url, :string

    belongs_to :user, Rumbl.Accounts.User
    belongs_to :category, Rumbl.Multimedia.Category

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :title, :desctiption, :category_id])
    |> validate_required([:url, :title, :desctiption])
    |> assoc_constraint(:category)
  end
end
