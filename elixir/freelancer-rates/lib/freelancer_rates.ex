defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - (discount / 100.0))
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> Kernel.*(22)
    |> apply_discount(discount)
    |> Float.ceil
    |> Kernel.trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_daily_rate = hourly_rate
    |> daily_rate
    |> apply_discount(discount)
    budget / discounted_daily_rate
    |> Float.floor(1)
  end
end
