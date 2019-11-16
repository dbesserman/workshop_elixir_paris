defmodule FindNumberWeb.PageController do
  use FindNumberWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
