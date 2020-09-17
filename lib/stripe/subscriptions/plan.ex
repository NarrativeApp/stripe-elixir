defmodule Stripe.Plan do
  use Stripe.API, [:create, :retrieve, :update, :delete, :list]

  @moduledoc false

  def endpoint do
    "plans"
  end
end
