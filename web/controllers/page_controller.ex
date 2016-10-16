defmodule Cagliostro.PageController do
  use Cagliostro.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
