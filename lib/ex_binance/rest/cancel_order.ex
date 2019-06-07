defmodule ExBinance.Rest.CancelOrder do
  alias ExBinance.Rest.HTTPClient

  @path "/api/v3/order"
  @receiving_window 1000

  def cancel_order_by_order_id(symbol, order_id, credentials) do
    params = %{
      symbol: symbol,
      orderId: order_id,
      timestamp: :os.system_time(:millisecond),
      recvWindow: @receiving_window
    }

    @path
    |> HTTPClient.delete(params, credentials)
    |> parse_response()
  end

  defp parse_response({:ok, response}), do: {:ok, ExBinance.CancelOrderResponse.new(response)}
end