defmodule Spreedly.URL do

  def add_gateway_url do
    "#{base_url()}/gateways.json"
  end

  def add_receiver_url do
    "#{base_url()}/receivers.json"
  end

  def authorization_url(gateway_token) do
    "#{base_url()}/gateways/#{gateway_token}/authorize.json"
  end

  def purchase_url(gateway_token) do
    "#{base_url()}/gateways/#{gateway_token}/purchase.json"
  end

  def verify_url(gateway_token) do
    "#{base_url()}/gateways/#{gateway_token}/verify.json"
  end

  def capture_url(transaction_token) do
    "#{base_url()}/transactions/#{transaction_token}/capture.json"
  end

  def void_url(transaction_token) do
    "#{base_url()}/transactions/#{transaction_token}/void.json"
  end

  def credit_url(transaction_token) do
    "#{base_url()}/transactions/#{transaction_token}/credit.json"
  end

  def show_gateway_url(token) do
    "#{base_url()}/gateways/#{token}.json"
  end

  def show_receiver_url(token) do
    "#{base_url()}/receivers/#{token}.json"
  end

  def show_payment_method_url(token) do
    "#{base_url()}/payment_methods/#{token}.json"
  end

  def show_transaction_url(token) do
    "#{base_url()}/transactions/#{token}.json"
  end

  def show_transcript_url(token) do
    "#{base_url()}/transactions/#{token}/transcript"
  end

  def add_payment_method_url do
    "#{base_url()}/payment_methods.json"
  end

  def retain_payment_method_url(token) do
    "#{base_url()}/payment_methods/#{token}/retain.json"
  end

  def redact_payment_method_url(token) do
    "#{base_url()}/payment_methods/#{token}/redact.json"
  end


  def list_payment_method_transactions_url(token, options) do
    encoded = URI.encode_query(options)
    "#{base_url()}/payment_methods/#{token}/transactions.json#{params(encoded)}"
  end

  def list_gateway_transactions_url(token, options) do
    encoded = URI.encode_query(options)
    "#{base_url()}/gateways/#{token}/transactions.json#{params(encoded)}"
  end

  defp params(""), do: ""
  defp params(query_str) do
    "?#{query_str}"
  end

  defp base_url do
    Application.get_env(:spreedly, :base_url, "https://core.spreedly.com/v1")
  end

end
