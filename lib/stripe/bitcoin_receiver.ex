defmodule Stripe.BitcoinReceiver do
  use Stripe.API, [:create, :retrieve, :list]

  @moduledoc false

  def endpoint do
    "bitcoin/receivers"
  end
end
