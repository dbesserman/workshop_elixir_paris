defmodule ArabicNumeralsTest do
  use ExUnit.Case
  doctest ArabicNumerals

  test "converts 1" do
    assert ArabicNumerals.convert(1) == "I"
  end

  @tag :skip
  test "converts 5" do
    assert ArabicNumerals.convert(5) == "V"
  end

  @tag :skip
  test "converts 10" do
    assert ArabicNumerals.convert(10) == "X"
  end

  @tag :skip
  test "converts 50" do
    assert ArabicNumerals.convert(50) == "L"
  end

  @tag :skip
  test "converts 100" do
    assert ArabicNumerals.convert(100) == "C"
  end

  @tag :skip
  test "converts 500" do
    assert ArabicNumerals.convert(500) == "D"
  end

  @tag :skip
  test "converts 1000" do
    assert ArabicNumerals.convert(1000) == "M"
  end

  @tag :skip
  test "converts 2" do
    assert ArabicNumerals.convert(2) == "II"
  end

  @tag :skip
  test "converts 3" do
    assert ArabicNumerals.convert(3) == "III"
  end

  @tag :skip
  test "converts 7" do
    assert ArabicNumerals.convert(7) == "VII"
  end

  @tag :skip
  test "converts 18" do
    assert ArabicNumerals.convert(18) == "XVIII"
  end

  @tag :skip
  test "converts 4827" do
    assert ArabicNumerals.convert(4827) == "MMMMDCCCXXVII"
  end
end
