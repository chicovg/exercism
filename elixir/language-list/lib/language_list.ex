defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_ | rest]), do: rest

  def first([first | _]), do: first

  def count(list), do: length(list)

  def functional_list?([first | rest]), do: first == "Elixir" or (length(rest) > 0 and functional_list?(rest))

 end
