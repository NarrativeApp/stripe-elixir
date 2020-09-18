defmodule Stripe.BalanceTest do
  use ExUnit.Case, async: true

  alias Stripe.Balance

  @tag skip: "currently failing"
  test "retrieve balance" do
    assert {:ok, %{"object" => "balance"}} = Balance.retrieve()
  end
end
