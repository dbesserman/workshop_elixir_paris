defmodule FindNumberWeb.Router do
  use FindNumberWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FindNumberWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/basic", CounterLive
    live "/main_exercice", FindNumberLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", FindNumberWeb do
  #   pipe_through :api
  # end
end
