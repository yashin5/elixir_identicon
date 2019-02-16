defmodule ElixirIdenticonTest do
  use ExUnit.Case
  doctest ElixirIdenticon

  test "hash a input" do
    input1 = ElixirIdenticon.hash_input("doragon")
    input2 = ElixirIdenticon.hash_input("doragon")
    input3 = ElixirIdenticon.hash_input("boru")
    assert input1==input2 && input1 != input3
  end
end
