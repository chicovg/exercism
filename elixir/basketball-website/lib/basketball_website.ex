defmodule BasketballWebsite do
  def extract_from_path(data, path), do: do_extract_from_path(data, String.split(path, "."))

  defp do_extract_from_path(data, [path]), do: data[path]
  defp do_extract_from_path(data, [path | rest]),
    do: if(is_nil(data[path]), do: nil, else: do_extract_from_path(data[path], rest))

  def get_in_path(data, path), do: Kernel.get_in(data, String.split(path, "."))
end
