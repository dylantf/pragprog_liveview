defmodule PentoWeb.PageControllerTest do
  use PentoWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "This is the home page"
  end
end
