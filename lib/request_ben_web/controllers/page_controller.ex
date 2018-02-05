defmodule RequestBenWeb.PageController do
  use RequestBenWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
