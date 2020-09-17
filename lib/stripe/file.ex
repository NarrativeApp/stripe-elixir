defmodule Stripe.File do
  use Stripe.API, [:create, :retrieve, :list]

  @moduledoc false

  def endpoint do
    "files"
  end
end
