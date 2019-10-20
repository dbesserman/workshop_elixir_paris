defmodule RomanNumeralsTest do
  use ExUnit.Case
  doctest RomanNumerals

  @tag :skip
  test "converts I" do
    assert RomanNumerals.convert("I") == 1
  end

  @tag :skip
  test "converts V" do
    assert RomanNumerals.convert("V") == 5
  end

  @tag :skip
  test "converts X" do
    assert RomanNumerals.convert("X") == 10
  end

  @tag :skip
  test "converts L" do
    assert RomanNumerals.convert("L") == 50
  end

  @tag :skip
  test "converts C" do
    assert RomanNumerals.convert("C") == 100
  end

  @tag :skip
  test "converts D" do
    assert RomanNumerals.convert("D") == 500
  end

  @tag :skip
  test "converts M" do
    assert RomanNumerals.convert("M") == 1000
  end

  @tag :skip
  test "converts II" do
    assert RomanNumerals.convert("II") == 2
  end

  @tag :skip
  test "converts VII" do
    assert RomanNumerals.convert("VII") == 7
  end

  @tag :skip
  test "converts MMMMDCCCXXVII" do
    assert RomanNumerals.convert("MMMMDCCCXXVII") == 4827
  end
end
