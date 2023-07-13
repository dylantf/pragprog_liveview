defmodule PentoWeb.SurveyLive do
  alias Pento.Catalog
  alias Pento.Survey
  use PentoWeb, :live_view
  alias __MODULE__.Component
  alias PentoWeb.DemographicLive
  alias PentoWeb.RatingLive

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_demographic()
     |> assign_products()}
  end

  defp assign_demographic(%{assigns: %{current_user: u}} = socket) do
    assign(socket, :demographic, Survey.get_demographic_by_user(u))
  end

  defp assign_products(%{assigns: %{current_user: u}} = socket) do
    assign(socket, :products, list_products(u))
  end

  defp list_products(user) do
    Catalog.list_products_with_user_rating(user)
  end

  def handle_info({:created_demographic, demographic}, socket) do
    {:noreply, handle_demographic_created(socket, demographic)}
  end

  def handle_info({:created_rating, updated_product, product_index}, socket) do
    {:noreply, handle_rating_created(socket, updated_product, product_index)}
  end

  defp handle_demographic_created(socket, demographic) do
    socket
    |> put_flash(:info, "Demographic created successfully")
    |> assign(:demographic, demographic)
  end

  defp handle_rating_created(%{assigns: %{products: products}} = socket, product, index) do
    socket
    |> put_flash(:info, "Rating submitted successfully")
    |> assign(
      :products,
      List.replace_at(products, index, product)
    )
  end
end
