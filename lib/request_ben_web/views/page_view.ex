defmodule RequestBenWeb.PageView do
  use RequestBenWeb, :view

  def handler_info(conn) do
  	"Request Handled By: #{controller_module conn}.#{action_name conn}"
  end
end


