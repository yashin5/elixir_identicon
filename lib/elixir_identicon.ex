defmodule ElixirIdenticon do
  def main(input) do 
    input
    |> hash_input
    |> pick_color
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %ElixirIdenticon.Image{hex: hex}
  end

  def pick_color(%ElixirIdenticon.Image{hex: [r, g, b | _rest_list]} = image) do
    %ElixirIdenticon.Image{image | color: [r, g, b]}
  end
end
