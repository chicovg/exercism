defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _) when direction not in [:north, :east, :south, :west],
    do: {:error, "invalid direction"}

  def create(_, position)
      when not is_tuple(position)
      when tuple_size(position) !== 2,
      do: {:error, "invalid position"}

  def create(_, {x, y})
      when not is_integer(x)
      when not is_integer(y),
      do: {:error, "invalid position"}

  def create(direction, position), do: {direction, position}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, ""), do: robot

  def simulate({direction, {x, y}}, "A" <> tail) do
    robot =
      case direction do
        :north -> {direction, {x, y + 1}}
        :south -> {direction, {x, y - 1}}
        :east -> {direction, {x + 1, y}}
        :west -> {direction, {x - 1, y}}
      end

    simulate(robot, tail)
  end

  def simulate({direction, position}, "R" <> tail) do
    robot =
      case direction do
        :north -> {:east, position}
        :south -> {:west, position}
        :east -> {:south, position}
        :west -> {:north, position}
      end

    simulate(robot, tail)
  end

  def simulate({direction, position}, "L" <> tail) do
    robot =
      case direction do
        :north -> {:west, position}
        :south -> {:east, position}
        :east -> {:north, position}
        :west -> {:south, position}
      end

    simulate(robot, tail)
  end

  def simulate(_, _), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction({direction, _}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position({_, position}), do: position
end
