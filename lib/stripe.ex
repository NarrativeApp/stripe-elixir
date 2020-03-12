defmodule Stripe do
  @moduledoc """
  Main module for handling sending/receiving requests to Stripe's API
  """

  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.stripe.com/v1/")
  plug(Tesla.Middleware.JSON, engine: Jason)

  @client_version Mix.Project.config()[:version]

  def version do
    @client_version
  end

  alias Stripe.{
    APIConnectionError,
    APIError,
    AuthenticationError,
    CardError,
    InvalidRequestError,
    RateLimitError
  }

  @missing_secret_key_error_message """
    The secret_key settings is required to use stripe. Please include your
    stripe secret api key in your application config file like so:

      config :stripe, secret_key: YOUR_SECRET_KEY

    Alternatively, you can also set the secret key as an environment variable:

      STRIPE_SECRET_KEY=YOUR_SECRET_KEY
  """

  defp get_secret_key do
    System.get_env("STRIPE_SECRET_KEY") ||
      Application.get_env(:stripe, :secret_key) ||
      raise AuthenticationError, message: @missing_secret_key_error_message
  end

  defp create_headers(opts) do
    headers = [
      {"Authorization", "Bearer #{get_secret_key()}"},
      {"User-Agent", "Stripe/v1 stripe-elixir/#{@client_version}"},
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]

    case Keyword.get(opts, :stripe_account) do
      nil -> headers
      account_id -> [{"Stripe-Account", account_id} | headers]
    end
  end

  def do_call(action, endpoint, data, opts) when action in [:get, :post, :delete] do
    request(method: action, url: endpoint, query: data, headers: create_headers(opts))
    |> handle_response
  end

  defp handle_response({:ok, %{body: body, status: 200}}) do
    {:ok, body}
  end

  defp handle_response({:ok, %{body: body, status: code}}) do
    %{"message" => message} =
      error =
      body
      |> Map.fetch!("error")

    error_struct =
      case code do
        code when code in [400, 404] ->
          %InvalidRequestError{message: message, param: error["param"]}

        401 ->
          %AuthenticationError{message: message}

        402 ->
          %CardError{message: message, code: error["code"], param: error["param"]}

        429 ->
          %RateLimitError{message: message}

        _ ->
          %APIError{message: message}
      end

    {:error, error_struct}
  end

  defp handle_response({:error, reason}) do
    %APIConnectionError{message: "Network Error: #{reason}"}
  end
end
