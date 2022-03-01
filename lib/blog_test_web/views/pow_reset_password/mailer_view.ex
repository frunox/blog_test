defmodule BlogTestWeb.PowResetPassword.MailerView do
  use BlogTestWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
