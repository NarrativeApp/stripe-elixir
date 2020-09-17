defmodule Stripe.Coupon do
  use Stripe.API, [:create, :retrieve, :update, :delete, :list]

  @moduledoc false

  def endpoint do
    "coupons"
  end
end
