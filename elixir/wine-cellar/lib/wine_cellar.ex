defmodule WineCellar do
  def explain_colors do
    [white: "Fermented without skin contact.",
     red: "Fermented with skin contact using dark-colored grapes.",
     rose: "Fermented with some skin contact, but not enough to qualify as a red wine."]
  end

  def filter(cellar, color, opts \\ [])
  def filter(cellar, color, []) do
    Keyword.get_values(cellar, color)
  end

  def filter(cellar, color, [{:year, year} | opts]) do
    filter(cellar, color, opts)
    |> filter_by_year(year)
  end

  def filter(cellar, color, [{:country, country} | opts]) do
    filter(cellar, color, opts)
    |> filter_by_country(country)
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
