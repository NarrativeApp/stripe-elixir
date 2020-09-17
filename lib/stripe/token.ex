defmodule Stripe.Token do
  use Stripe.API, [:create, :retrieve]

  @moduledoc false

  def endpoint do
    "tokens"
  end
end
