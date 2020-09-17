defmodule Stripe.Refund do
  use Stripe.API, [:create, :retrieve, :update, :list]

  @moduledoc false

  def endpoint do
    "refunds"
  end
end
