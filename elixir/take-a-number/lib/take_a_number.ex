defmodule TakeANumber do
  defp handle_messages(number) do
    receive do
      {:report_state, receiver} ->
        send(receiver, number)
        handle_messages(number)
      {:take_a_number, receiver} ->
        send(receiver, number + 1)
        handle_messages(number + 1)
      :stop -> nil
      _ -> handle_messages(number)
    end
  end

  def start() do
    spawn(fn -> handle_messages(0) end)
  end
end
