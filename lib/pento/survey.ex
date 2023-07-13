defmodule Pento.Survey do
  import Ecto.Query, warn: false
  alias Pento.Repo
  alias Pento.Survey.Demographic
  alias Pento.Survey.Rating

  def list_demographics do
    Repo.all(Demographic)
  end

  def get_demographic!(id), do: Repo.get!(Demographic, id)

  def get_demographic_by_user(user) do
    Demographic.Query.for_user(user)
    |> Repo.one()
  end

  def create_demographic(attrs \\ %{}) do
    %Demographic{}
    |> Demographic.changeset(attrs)
    |> Repo.insert()
  end

  def update_demographic(%Demographic{} = demographic, attrs) do
    demographic
    |> Demographic.changeset(attrs)
    |> Repo.update()
  end

  def delete_demographic(%Demographic{} = demographic) do
    Repo.delete(demographic)
  end

  def change_demographic(%Demographic{} = demographic, attrs \\ %{}) do
    Demographic.changeset(demographic, attrs)
  end

  def list_ratings do
    Repo.all(Rating)
  end

  def get_rating!(id), do: Repo.get!(Rating, id)

  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  def update_rating(%Rating{} = rating, attrs) do
    rating
    |> Rating.changeset(attrs)
    |> Repo.update()
  end

  def delete_rating(%Rating{} = rating) do
    Repo.delete(rating)
  end

  def change_rating(%Rating{} = rating, attrs \\ %{}) do
    Rating.changeset(rating, attrs)
  end
end
