defmodule RequestBenWeb.PageController do
  use RequestBenWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, _params) do
  	headers = conn.req_headers
  	render conn, "test.html"
  end
end
