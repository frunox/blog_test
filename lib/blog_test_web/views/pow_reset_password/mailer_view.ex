defmodule BlogTestWeb.PowResetPassword.MailerView do
  use BlogTestWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
