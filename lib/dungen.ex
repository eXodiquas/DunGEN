defmodule DungeonGenerator do
  defstruct room: nil, grid: %{}, processed_rooms: []

  def print_dungeon(state) do
    min_x = state.processed_rooms |> Enum.min_by(&(&1.x)) |> Map.get(:x)
    max_x = state.processed_rooms |> Enum.max_by(&(&1.x)) |> Map.get(:x)
    min_y = state.processed_rooms |> Enum.min_by(&(&1.y)) |> Map.get(:y)
    max_y = state.processed_rooms |> Enum.max_by(&(&1.y)) |> Map.get(:y)

    for y <- Enum.reverse(min_y..max_y) do
      for x <- min_x..max_x do
        room = %{x: x, y: y}
        room_symbol = if room in state.processed_rooms, do: "X", else: " "
        IO.write("#{room_symbol}")
      end
      IO.puts("")
    end
  end

  def generate_dungeon(num_rooms) do
    starting_room = create_room(0, 0)
    state = %DungeonGenerator{room: starting_room, grid: %{starting_room => []}, processed_rooms: [starting_room]}
    generate_dungeon_recursive(state, num_rooms - 1)
  end

  defp generate_dungeon_recursive(state, 0), do: state

  defp generate_dungeon_recursive(state, num_rooms) do
    {room, new_state} = generate_room(state)
    new_state = connect_room(new_state, room)
    generate_dungeon_recursive(new_state, num_rooms - 1)
  end

  defp generate_room(state) do
    directions = [:north, :south, :west, :east] |> Enum.take_random(1..4 |> Enum.random) |> Enum.shuffle()

    Enum.reduce(directions, {state.room, state}, fn direction, {current_room, current_state} ->
      if can_add_door?(current_room, current_state.grid, direction) do
        room = create_room_in_direction(current_room, direction)
        grid = Map.put(current_state.grid, room, [])
        {room, %{current_state | room: room, grid: grid, processed_rooms: [room | current_state.processed_rooms]}}
      else
        {current_room, current_state}
      end
    end)
  end

  defp can_add_door?(room, grid, direction) do
    !Map.has_key?(grid, create_room_in_direction(room, direction))
  end

  defp create_room_in_direction(room, direction) do
    case direction do
      :north -> %{x: room.x, y: room.y + 1}
      :south -> %{x: room.x, y: room.y - 1}
      :west  -> %{x: room.x - 1, y: room.y}
      :east  -> %{x: room.x + 1, y: room.y}
    end
  end

  defp create_room(x, y), do: %{x: x, y: y}

  defp connect_room(state, room) do
    current_room = state.room
    _direction = get_direction(current_room, room)
    grid = Map.update(state.grid, current_room, [room], &([room | &1]))
    grid = Map.update(grid, room, [current_room], &([current_room | &1]))
    %{state | grid: grid, room: current_room}
  end

  defp get_direction(room1, room2) do
    if room1.x == room2.x do
      if room1.y < room2.y, do: :north, else: :south
    else
      if room1.x < room2.x, do: :east, else: :west
    end
  end
end
