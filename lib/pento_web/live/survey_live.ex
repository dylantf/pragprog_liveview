defmodule PentoWeb.SurveyLive do
  alias Pento.Survey
  use PentoWeb, :live_view
  alias __MODULE__.Component
  alias PentoWeb.DemographicLive

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_demographic}
  end

  defp assign_demographic(%{assigns: %{current_user: u}} = socket) do
    assign(socket, :demographic, Survey.get_demographic_by_user(u))
  end
end
