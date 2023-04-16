defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, fn i -> i[:price] end)

  def with_missing_price(inventory), do: Enum.filter(inventory, fn i -> is_nil(i[:price]) end)

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn m ->
      Map.update(m, :name, nil, &(String.replace(&1, old_word, new_word)))
    end)
  end

  def increase_quantity(item, count) do
    Map.update(item, :quantity_by_size, %{},
      fn qbs ->
        Enum.into(qbs, %{}, fn {k, v} -> {k, v + count} end)
      end)
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size, %{})
    |> Enum.reduce(0, fn {_, v}, acc -> acc + v end)
  end
end
