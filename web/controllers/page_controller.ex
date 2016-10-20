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
      acc ++ csv
    end)

    json_data = csv_data
    |> Poison.encode!

    csv_name_files = csv_files
    |> Enum.reduce([], fn(csv_file, acc) ->
      csv_file
      acc ++ [csv_file]
    end)

    Logger.info csv_name_files
    Logger.info json_data

    render conn, "index.html", csv_data: csv_data, csv_name_files: csv_name_files
  end
end
