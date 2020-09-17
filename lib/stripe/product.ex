defmodule Stripe.Product do
  use Stripe.API, [:create, :retrieve, :update, :list, :delete]

  @moduledoc false

  def endpoint do
    "products"
  end
end
