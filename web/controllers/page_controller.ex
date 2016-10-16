defmodule Cagliostro.PageController do
  use Cagliostro.Web, :controller

  require Logger

  def index(conn, _params) do
    {pwd, 0} = System.cmd("pwd", [])
    csv_dir = String.replace(pwd,"\n","") <> "/csv"
    {:ok, csv_files} = File.ls(csv_dir)

    csv_data = csv_files
    |> Enum.reduce([], fn(csv_file, acc) ->
      {:ok, csv} = File.read!(csv_dir <> "/"  <> csv_file )
      |> ExCsv.parse
      Logger.info csv_file
      acc ++ csv
    end)

    render conn, "index.html", csv_data: csv_data
  end
end
