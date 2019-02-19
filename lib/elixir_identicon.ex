defmodule ElixirIdenticon do
  @moduledoc false

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
  end

  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %ElixirIdenticon.Image{hex: hex}
  end

  def pick_color(%ElixirIdenticon.Image{hex: [r, g, b | _rest_list]} = image) do
    %ElixirIdenticon.Image{image | color: [r, g, b]}
  end

  def build_grid(%ElixirIdenticon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()
      |> build_pixel_map

    %ElixirIdenticon.Image{image | grid: grid}
  end

  def mirror_row([first, second | _tail] = row) do
    row ++ [first, second]
  end

  def filter_odd_squares(%ElixirIdenticon.Image{grid: grid} = image) do
    filter = fn ({code, _index} = grid) = grid -> rem(code, 2) == 0 end
    grid = Enum.filter(grid, filter)

    %ElixirIdenticon.Image{image | grid: grid}
  end

  def build_pixel_map(%ElixirIdenticon.Image{grid: grid} = image) do
    Enum.map(grid, fn {_code, index} ->
      1
    end)
  end
end
