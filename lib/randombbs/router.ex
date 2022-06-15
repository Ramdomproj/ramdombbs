defmodule Randombbs.Router do
  use Plug.Router

  plug Plug.Logger
  plug Plug.Static,
    at: "/",
    from: "www",
    only: ["user", "images", "assets", "home.html", "robots.txt"]

  plug Plug.Parsers,
    parsers: [:urlencoded]
  plug :match
  plug :dispatch

  get "/" do
    home_page = File.read!("www/home.html")
    send_resp(conn, 200, home_page)
  end

  get "/hello/:name" do
    send_resp(conn, 200, "this url is for testing\nhello #{name}")
  end

  post "/signup" do
    IO.inspect(conn)
    send_resp(conn, 200, "sign up successful...才怪")
  end

  post "/login" do
    IO.inspect(conn)
    send_resp(conn, 200, "log in successful...才怪")
  end

  match _ do
    send_resp(conn, 404, "404 Not Found\nYou Muffin Head")
  end
end
