defmodule BlogTestWeb.Pow.Routes do
  use Pow.Phoenix.Routes
  alias BlogTestWeb.Router.Helpers, as: Routes

  def after_sign_out_path(conn) do
    Routes.blog_path(conn, :index)
  end

  def user_not_authenticated_path(conn) do
    Routes.blog_path(conn, :index)
  end
end
