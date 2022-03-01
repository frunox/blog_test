defmodule BlogTestWeb.BlogController do
  use BlogTestWeb, :controller

  alias BlogTest.Blog

  def index(conn, _params) do
    # IO.inspect(conn.assigns.current_user.username, label: "current_user")
    render(conn, "index.html", posts: Blog.all_posts())
  end

  def show(conn, %{"id" => id}) do
    if is_nil(conn.assigns.current_user) do
      conn
      |> put_flash(:error, "You must sign in or register to see a post")
      |> redirect(to: Routes.blog_path(conn, :index))
    else
      render(conn, "show.html", post: Blog.get_post_by_id!(id))
    end
  end
end
