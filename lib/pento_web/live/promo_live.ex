defmodule PentoWeb.PromoLive do
  use PentoWeb, :live_view
  alias Pento.Promo
  alias Pento.Promo.Recipient

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_recipient()
     |> assign_changeset()}
  end

  defp assign_changeset(%{assigns: %{recipient: recipient}} = socket) do
    socket
    |> assign(:changeset, Promo.change_recipient(recipient))
  end

  defp assign_recipient(socket) do
    socket
    |> assign(:recipient, %Recipient{})
  end

  def handle_event("validate", params, socket) do
    %{"recipient" => recipient_params} = params
    %{assigns: %{recipient: recipient}} = socket

    changeset =
      recipient
      |> Promo.change_recipient(recipient_params)
      |> Map.put(:action, :validate)

    {:noreply, socket |> assign(:changeset, changeset)}
  end

  def handle_event("save", %{"recipient" => _recipient_params}, _socket) do
    :timer.sleep(1000)

    # changeset = Promo.change_recipient(recipient, recipient_params)
    # if changeset.valid?
    raise "not implemented"
    # The book decided not to tell us what to do here
  end
end
