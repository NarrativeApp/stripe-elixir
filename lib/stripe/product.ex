defmodule Stripe.Product do
  use Stripe.API, [:create, :retrieve, :update, :list]

  def endpoint do
    "products"
  end
end
