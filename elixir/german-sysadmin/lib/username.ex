defmodule Username do
  def sanitize(''), do: ''
  def sanitize([head | tail]) do
    sanitized_tail = sanitize(tail)
    case head do
      ?ä -> 'ae' ++ sanitized_tail
      ?ö -> 'oe' ++ sanitized_tail
      ?ü -> 'ue' ++ sanitized_tail
      ?ß -> 'ss' ++ sanitized_tail
      head when head >= ?a and head <= ?z -> [head | sanitized_tail]
      ?_ -> [head | sanitized_tail]
      _ -> sanitized_tail
    end
  end
end
