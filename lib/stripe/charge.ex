defmodule Stripe.Charge do
  use Stripe.API, [:list, :retrieve, :create, :update]

  def endpoint do
    "charges"
  end

  def capture_endpoint(id) do
    "#{endpoint()}/#{id}/capture"
  end

  def capture(id, opts \\ []) do
    Stripe.do_call(:post, capture_endpoint(id), [], opts)
  end

  def capture(id, data, opts) do
    Stripe.do_call(:post, capture_endpoint(id), data, opts)
  end
end
