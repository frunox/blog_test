defmodule BlogTest.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogTest.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        post_id: "some post_id"
      })
      |> BlogTest.Posts.create_post()

    post
  end
end
