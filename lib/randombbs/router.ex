defmodule Randombbs.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    root_page = File.read!("www/index.html")
    send_resp(conn, 200, root_page)
  end

  match _ do
    send_resp(conn, 404, "404 Not Found\nYou Muffin Head")
  end
end
