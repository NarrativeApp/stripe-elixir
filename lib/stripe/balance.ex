defmodule Stripe.Balance do
  use Stripe.API, [:list]

  @moduledoc false

  def endpoint do
    "balance"
  end

  def retrieve do
    list()
  end
end
