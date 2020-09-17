defmodule Stripe.Recipient do
  use Stripe.API, [:create, :retrieve, :update, :delete, :list]

  @moduledoc false

  def endpoint do
    "recipients"
  end
end
