defmodule Stripe.Event do
  use Stripe.API, [:retrieve, :list]

  @moduledoc false

  def endpoint do
    "events"
  end
end
