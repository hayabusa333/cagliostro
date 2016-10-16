defmodule Cagliostro.PageController do
  use Cagliostro.Web, :controller

  require Logger

  def index(conn, _params) do
    {pwd, 0} = System.cmd("pwd", [])
    csv_dir = String.replace(pwd,"\n","") <> "/csv"
    {:ok, csv_files} = File.ls(csv_dir)
    csv_date = File.read!(csv_dir <> "/"  <> Enum.at(csv_files, 0) )


    Logger.info csv_date

    render conn, "index.html"
  end
end
