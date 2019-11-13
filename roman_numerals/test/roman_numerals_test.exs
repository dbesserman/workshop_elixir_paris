defmodule RomanNumeralsTest do
  use ExUnit.Case
  doctest RomanNumerals

  test "converts I" do
    assert RomanNumerals.convert("I") == 1
  end

  test "converts IV" do
    assert RomanNumerals.convert("IV") == 4
  end

  test "converts V" do
    assert RomanNumerals.convert("V") == 5
  end

  test "converts IX" do
    assert RomanNumerals.convert("IX") == 9
  end

  test "converts X" do
    assert RomanNumerals.convert("X") == 10
  end

  test "converts L" do
    assert RomanNumerals.convert("L") == 50
  end

  test "converts C" do
    assert RomanNumerals.convert("C") == 100
  end

  test "converts D" do
    assert RomanNumerals.convert("D") == 500
  end

  test "converts M" do
    assert RomanNumerals.convert("M") == 1000
  end

  test "converts II" do
    assert RomanNumerals.convert("II") == 2
  end

  test "converts VII" do
    assert RomanNumerals.convert("VII") == 7
  end

  test "converts MIX" do
    assert RomanNumerals.convert("MIX") == 1009
  end

  test "converts MMMMDCCCXXVII" do
    assert RomanNumerals.convert("MMMMDCCCXXVII") == 4827
  end
end
