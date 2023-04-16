defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  def display_distance(remote_car) when is_struct(remote_car, RemoteControlCar),
    do: "#{remote_car.distance_driven_in_meters} meters"

  def display_battery(remote_car)
      when is_struct(remote_car, RemoteControlCar) and remote_car.battery_percentage == 0,
      do: "Battery empty"

  def display_battery(remote_car) when is_struct(remote_car, RemoteControlCar),
    do: "Battery at #{remote_car.battery_percentage}%"

  def drive(remote_car)
      when is_struct(remote_car, RemoteControlCar) and remote_car.battery_percentage == 0,
      do: remote_car

  def drive(remote_car) when is_struct(remote_car, RemoteControlCar),
    do:
      remote_car
      |> Map.update(:battery_percentage, 0, &(&1 - 1))
      |> Map.update(:distance_driven_in_meters, 0, &(&1 + 20))
end
