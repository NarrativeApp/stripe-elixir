defmodule Stripe.SubscriptionItem do
  use Stripe.API, [:create, :retrieve, :update, :delete, :list]

  @moduledoc false

  def endpoint do
    "subscription_items"
  end
end
