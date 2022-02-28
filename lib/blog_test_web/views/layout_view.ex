defmodule BlogTestWeb.LayoutView do
  use BlogTestWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def template_not_found(template, _assigns) do
      Phoenix.Controller.status_message_from_template(template)
  end
end
