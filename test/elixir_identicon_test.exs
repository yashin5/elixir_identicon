defmodule ElixirIdenticonTest do
  use ExUnit.Case
  doctest ElixirIdenticon

  test "hash a input" do
    input1 = ElixirIdenticon.hash_input("doragon")
    input2 = ElixirIdenticon.hash_input("doragon")
    input3 = ElixirIdenticon.hash_input("boru")
    assert input1==input2 && input1 != input3
  end

  test "pick a color of the binary list" do
    color1 = ElixirIdenticon.hash_input("doragon")
    |> ElixirIdenticon.pick_color
    assert [63, 194, 73 | rest] = color1
  end
end
