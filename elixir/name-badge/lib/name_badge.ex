defmodule NameBadge do
  def print(id, name, dept) do
    id = if id, do: "[#{id}] - ", else: ""
    dept = if dept, do: " - #{String.upcase(dept)}", else: " - OWNER"

    "#{id}#{name}#{dept}"
  end
end
