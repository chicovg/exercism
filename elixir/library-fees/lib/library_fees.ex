defmodule LibraryFees do
  def datetime_from_string(string) do
    case NaiveDateTime.from_iso8601(string) do
      {:ok, datetime} -> datetime
      true -> nil
    end
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(~T[12:00:00Z])
    |> Kernel.==(:lt)
  end

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(if(before_noon?(checkout_datetime), do: 28, else: 29))
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_date = checkout |> datetime_from_string() |> return_date()
    actual_return_datetime = return |> datetime_from_string()
    rate = if(monday?(actual_return_datetime), do: rate * 0.5, else: rate)

    planned_return_date
    |> days_late(actual_return_datetime)
    |> Kernel.*(rate)
    |> trunc()
  end
end
