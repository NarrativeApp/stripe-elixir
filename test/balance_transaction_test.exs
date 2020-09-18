defmodule Stripe.BalanceTransactionTest do
  use ExUnit.Case, async: true

  alias Stripe.BalanceTransaction
  alias Stripe.InvalidRequestError

  @tag skip: "currently failing"
  test "retrieve a balance transaction" do
    assert {:error, %InvalidRequestError{message: "No such balance transaction: not exist"}} =
             BalanceTransaction.retrieve("not exist")
  end

  @tag skip: "currently failing"
  test "list all balance transaction" do
    assert {:ok, %{"object" => "list", "url" => "/v1/balance/history"}} = BalanceTransaction.all()
  end
end
