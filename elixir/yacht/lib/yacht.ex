defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer

  def score(:ones, dice), do: single_value_score(1, dice)

  def score(:twos, dice), do: single_value_score(2, dice)

  def score(:threes, dice), do: single_value_score(3, dice)

  def score(:fours, dice), do: single_value_score(4, dice)

  def score(:fives, dice), do: single_value_score(5, dice)

  def score(:sixes, dice), do: single_value_score(6, dice)

  def score(:full_house, dice),
    do: if([2, 3] == Enum.frequencies(dice) |> Map.values() |> Enum.sort(), do: Enum.sum(dice), else: 0)

  def score(:four_of_a_kind, dice) do
    dice
    |> Enum.frequencies()
    |> Enum.reduce(0, fn {num, count}, acc -> if(count >= 4, do: 4 * num, else: acc) end)
  end

  def score(:little_straight, dice), do: if(Enum.sort(dice) == [1, 2, 3, 4, 5], do: 30, else: 0)

  def score(:big_straight, dice), do: if(Enum.sort(dice) == [2, 3, 4, 5, 6], do: 30, else: 0)

  def score(:choice, dice), do: Enum.sum(dice)

  def score(:yacht, dice),
    do: if([5] == Enum.frequencies(dice) |> Map.values(), do: 50, else: 0)

  defp single_value_score(n, dice), do: Enum.count(dice, fn x -> x == n end) * n

end
