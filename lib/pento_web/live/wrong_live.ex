defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, session, socket) do
    {
      :ok,
      assign(
        socket,
        secret_number: rand_number(),
        score: 0,
        message: "Make a guess: ",
        session_id: session["live_socket_id"]
      )
    }
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2><%= @message %></h2>
    <h2>
      <%= for n <- 1..10 do %>
        <.link href="#" phx-click="guess" phx-value-number={n}>
          <%= n %>
        </.link>
      <% end %>
    </h2>
    <pre>
      <%= @current_user.email %>
      <%= @session_id %>
    </pre>
    """
  end

  def rand_number, do: Enum.random(1..10)

  def handle_event("guess", %{"number" => guess}, socket) do
    {guess, _} = Integer.parse(guess)

    if guess == socket.assigns.secret_number do
      {:noreply,
       assign(socket,
         message: "You won! Try a new number! ",
         score: socket.assigns.score + 1,
         secret_number: rand_number()
       )}
    else
      {:noreply,
       assign(socket,
         message: "Your guess: #{guess}. Wrong. Guess again. ",
         score: socket.assigns.score - 1
       )}
    end
  end
end
