defmodule Stripe.TaxRate do
  use Stripe.API, [:create, :retrieve, :update, :list]

  def endpoint do
    "tax_rates"
  end
end
