defmodule ElixirIdenticon do
  def main(input) do 
    input
    |> hash_input
    |> pich_color
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %ElixirIdenticon.Image{hex: hex}
  end
end
