defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\].*/

  def split_line(line) do
    String.split(line, ~r/\<[*~=-]*>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line\d+/i, "")
  end

  def tag_with_user_name(line) do
    match = Regex.run(~r/User\s+(\S+)\s*/u, line, [capture: :all_but_first])
    if match do
      "[USER] #{List.first(match)} #{line}"
    else
      line
    end
  end
end
