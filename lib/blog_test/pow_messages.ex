defmodule BlogTestWeb.Pow.Messages do
  use Pow.Phoenix.Messages

  use Pow.Extension.Phoenix.Messages,
    extensions: [PowResetPassword, PowAssent]

  import BlogTestWeb.Gettext

  def signed_out(_conn) do
    gettext("Signed out successfully.")
  end

  def user_not_authenticated(_conn) do
    gettext("You must log in to see this page")
  end

  def pow_assent_login_with_provider(_conn) do
    gettext("Logging in with Github")
  end

  def pow_assent_signed_in(conn) do
    provider = Phoenix.Naming.humanize(conn.params["provider"])
    IO.inspect(provider, label: "$$$$$$$$ provider:")

    gettext("You signed in with Github.")
  end

  def pow_assent_signed_out(_conn) do
    gettext("You were successfully signed out.")
  end
end
