defmodule DAWeb.Router do
  use DAWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DAWeb do
    pipe_through :browser # Use the default browser stack

    get "/", ReactController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", DAWeb do
  #   pipe_through :api
  # end
end
