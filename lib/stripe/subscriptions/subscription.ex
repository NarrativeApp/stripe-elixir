defmodule Stripe.Subscription do
  use Stripe.API, [:create, :retrieve, :update, :delete, :list]

  def endpoint do
    "subscriptions"
  end

  def delete_discount(subscription_id, opts \\ []) do
    Stripe.do_call(:delete, "#{endpoint()}/#{subscription_id}/discount", [], opts)
  end
end
