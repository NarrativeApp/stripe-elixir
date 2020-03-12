defmodule Stripe.ApplicationFee do
  use Stripe.API, [:create, :retrieve, :update, :list]

  def endpoint do
    "application_fees"
  end

  def refund(fee_id, opts \\ []) do
    Stripe.do_call(:post, "#{endpoint()}/#{fee_id}/refund", [], opts)
  end

  def retrieve_refund(fee_id, refund_id, opts \\ []) do
    Stripe.do_call(:get, "#{endpoint()}/#{fee_id}/refund/#{refund_id}", [], opts)
  end
end
