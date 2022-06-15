defmodule Randombbs.Router do
  use Plug.Router

  plug Plug.Logger
  plug Plug.Static,
    at: "/",
    from: "www",
    only: ["user", "images", "js", "css", "home.html"]

  plug(Plug.Parsers, parsers: [:urlencoded])
  plug :match
  plug :dispatch

  get "/" do
    home_page = File.read!("www/home.html")
    send_resp(conn, 200, home_page)
  end

  match _ do
    send_resp(conn, 404, "404 Not Found\nYou Muffin Head")
  end
end
