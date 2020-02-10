defmodule Stripe.Product do
  use Stripe.API, [:create, :retrieve, :update, :list, :delete]

  def endpoint do
    "products"
  end
end
