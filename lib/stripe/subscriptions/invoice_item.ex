defmodule Stripe.InvoiceItem do
  use Stripe.API, [:create, :retrieve, :update, :delete, :list]

  @moduledoc false

  def endpoint do
    "invoiceitems"
  end
end
