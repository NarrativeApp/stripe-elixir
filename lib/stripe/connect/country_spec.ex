defmodule Stripe.CountrySpec do
  use Stripe.API, [:retrieve, :list]

  @moduledoc false

  def endpoint do
    "country_specs"
  end
end
