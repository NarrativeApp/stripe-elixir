defmodule Stripe.BalanceTransaction do
  use Stripe.API, [:retrieve, :list]

  @moduledoc false

  def endpoint do
    "balance/history"
  end

  def all(opts \\ []) do
    list([], opts)
  end
end
