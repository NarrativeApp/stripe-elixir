defmodule Stripe.Dispute do
  use Stripe.API, [:list, :create, :update]

  @moduledoc false

  def endpoint do
    "disputes"
  end

  def close_dispute_endpoint(id) do
    "#{endpoint()}/#{id}/close"
  end

  def close(id, opts \\ []) do
    Stripe.do_call(:post, close_dispute_endpoint(id), [], opts)
  end
end
