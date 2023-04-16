defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  defp get_input_trimmed(prompt), do: IO.gets(prompt) |> String.trim()

  def ask_name(), do: get_input_trimmed("What is your character's name?\n")

  def ask_class(), do: get_input_trimmed("What is your character's class?\n")

  def ask_level(), do: get_input_trimmed("What is your character's level?\n") |> String.to_integer()

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    IO.inspect(%{name: name, class: class, level: level}, label: "Your character")
  end
end
