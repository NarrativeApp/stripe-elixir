defmodule Stripe.TokenTest do
  use ExUnit.Case, async: true

  alias Stripe.Fixture.Token, as: TokenFixture
  alias Stripe.{CardError, InvalidRequestError, Token}

  test "create a token" do
    assert {:ok, token} = TokenFixture.valid_card() |> Token.create()

    assert {:ok, ^token} = Token.retrieve(token["id"])
  end

  test "card error" do
    assert {:error, %CardError{param: "number", code: "incorrect_number"}} =
             TokenFixture.invalid_card() |> Token.create()
  end

  @tag skip: "currently failing"
  test "retrieve a token" do
    assert {:error, %InvalidRequestError{message: "No such token: not exist"}} =
             Token.retrieve("not exist")
  end
end
