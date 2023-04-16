defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume

  def to_milliliter({_ = :milliliter, volume}), do: {:milliliter, volume}
  def to_milliliter({_ = :cup, volume}), do: {:milliliter, volume * 240}
  def to_milliliter({_ = :fluid_ounce, volume}), do: {:milliliter, volume * 30}
  def to_milliliter({_ = :teaspoon, volume}), do: {:milliliter, volume * 5}
  def to_milliliter({_ = :tablespoon, volume}), do: {:milliliter, volume * 15}

  def from_milliliter({_ = :milliliter, volume}, :milliliter), do: {:milliliter, volume}
  def from_milliliter({_ = :milliliter, volume}, :cup), do: {:cup, volume / 240}
  def from_milliliter({_ = :milliliter, volume}, :fluid_ounce), do: {:fluid_ounce, volume / 30}
  def from_milliliter({_ = :milliliter, volume}, :teaspoon), do: {:teaspoon, volume / 5}
  def from_milliliter({_ = :milliliter, volume}, :tablespoon), do: {:tablespoon, volume / 15}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
