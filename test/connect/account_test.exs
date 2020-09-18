defmodule Stripe.AccountTest do
  use ExUnit.Case

  @tag skip: "currently failing"
  test "create/update/retrieve/delete an account" do
    assert {:ok, account} = Stripe.Account.create(type: "custom")
    assert {:ok, %{"email" => _email}} = Stripe.Account.retrieve(account["id"])

    assert {:ok, %{"metadata" => %{"test" => "data"}}} =
             Stripe.Account.update(account["id"], metadata: [test: "data"])

    assert {:ok, _} = Stripe.Account.delete(account["id"])
    assert {:error, _} = Stripe.Account.retrieve(account["id"])
  end

  test "list all accounts" do
    assert {:ok, %{"object" => "list", "url" => "/v1/accounts"}} = Stripe.Account.list()
  end

  @tag skip: "currently failing"
  test "create/update/retrieve/delete/list an external_account" do
    {:ok, account} = Stripe.Account.create(type: "custom")

    {:ok, token} =
      Stripe.Token.create(
        card: [
          number: "4000056655665556",
          exp_month: 7,
          exp_year: 2018,
          cvc: "314",
          currency: "usd"
        ]
      )

    {:ok, token2} =
      Stripe.Token.create(
        card: [
          number: "5200828282828210",
          exp_month: 7,
          exp_year: 2018,
          cvc: "314",
          currency: "usd"
        ]
      )

    account_id = account["id"]

    assert {:ok, external_account} =
             Stripe.Account.create_external_account(account_id, external_account: token["id"])

    assert {:ok, external_account2} =
             Stripe.Account.create_external_account(account_id, external_account: token2["id"])

    url = "/v1/accounts/#{account_id}/external_accounts"

    assert {:ok, %{"object" => "list", "url" => ^url}} =
             Stripe.Account.list_external_account(account_id)

    external_account_id = external_account["id"]
    external_account_id2 = external_account2["id"]

    assert {:ok, ^external_account} =
             Stripe.Account.retrieve_external_account(account_id, external_account_id)

    assert {:ok, %{"metadata" => %{"test" => "data"}}} =
             Stripe.Account.update_external_account(account_id, external_account_id,
               metadata: [test: "data"]
             )

    assert {:ok, _} = Stripe.Account.delete_external_account(account_id, external_account_id2)

    assert {:error, _} =
             Stripe.Account.retrieve_external_account(account_id, external_account_id2)
  end
end
