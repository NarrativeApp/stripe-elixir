defmodule Stripe.ChargeTest do
  use ExUnit.Case, async: true

  alias Stripe.Charge
  alias Stripe.InvalidRequestError

  @tag skip: "currently failing"
  test "create a charge" do
    assert {:error, %InvalidRequestError{message: "Must provide source or customer."}} =
             Charge.create([])
  end

  @tag skip: "currently failing"
  test "retrieve a charge" do
    assert {:error, %InvalidRequestError{message: "No such charge: not exist"}} =
             Charge.retrieve("not exist")
  end

  @tag skip: "currently failing"
  test "list all charges" do
    assert {:ok, %{"object" => "list", "url" => "/v1/charges"}} = Charge.list()
  end
end
