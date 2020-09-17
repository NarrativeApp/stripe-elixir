defmodule Stripe.TaxRate do
  use Stripe.API, [:create, :retrieve, :update, :list]

  @moduledoc false

  def endpoint do
    "tax_rates"
  end
end
