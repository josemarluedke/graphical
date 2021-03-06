defmodule Graphical.Guardian do
  use Guardian, opt_app: :graphical
  alias Graphical.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_lcaims(claims) do
    user = claims["sub"] |> Accounts.get_user!()
    {:ok, user}
  end
end
