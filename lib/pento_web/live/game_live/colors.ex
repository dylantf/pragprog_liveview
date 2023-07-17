defmodule PentoWeb.GameLive.Colors do
  def color(c), do: color(c, false, false)

  def color(_color, true, _completed), do: "#B86EF0"
  def color(_color, _active, true), do: "#000000"
  def color(c, false, false), do: color_code(c)

  def color_code(:green), do: "#8BBF57"
  def color_code(:dark_green), do: "#689042"
  def color_code(:light_green), do: "#C1D6AC"
  def color_code(:orange), do: "#B97328"
  def color_code(:dark_orange), do: "#8D571E"
  def color_code(:light_orange), do: "#F4CCA1"
  def color_code(:gray), do: "#848386"
  def color_code(:dark_gray), do: "#5A595A"
  def color_code(:light_gray), do: "#B1B1B1"
  def color_code(:blue), do: "#83C7CE"
  def color_code(:dark_blue), do: "#63969B"
  def color_code(:light_blue), do: "#B9D7DA"
  def color_code(:purple), do: "#240054"
end
