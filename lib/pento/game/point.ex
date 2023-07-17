defmodule Pento.Game.Point do
  @type coordinate() :: {integer(), integer()}

  @spec new(integer, integer) :: coordinate()
  def new(x, y) when is_integer(x) and is_integer(y), do: {x, y}

  @spec move(coordinate(), coordinate()) :: coordinate()
  def move({x, y}, {change_x, change_y}) do
    {x + change_x, y + change_y}
  end

  @spec transpose(coordinate()) :: coordinate()
  def transpose({x, y}), do: {y, x}

  @spec flip(coordinate()) :: coordinate()
  def flip({x, y}), do: {x, 6 - y}

  @spec reflect(coordinate()) :: coordinate()
  def reflect({x, y}), do: {6 - x, y}

  @spec rotate(coordinate(), integer()) :: coordinate()
  def rotate(point, 0), do: point
  def rotate(point, 90), do: point |> reflect() |> transpose()
  def rotate(point, 180), do: point |> reflect() |> flip()
  def rotate(point, 270), do: point |> flip() |> transpose()

  @spec center(coordinate()) :: coordinate()
  def center(point), do: move(point, {-3, -3})

  @spec prepare(coordinate(), integer(), boolean(), coordinate()) :: coordinate()
  def prepare(point, rotation, reflected, location) do
    point
    |> rotate(rotation)
    |> maybe_reflect(reflected)
    |> move(location)
    |> center()
  end

  def maybe_reflect(point, true), do: reflect(point)
  def maybe_reflect(point, false), do: point
end
