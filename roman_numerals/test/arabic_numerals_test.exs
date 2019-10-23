defmodule ArabicNumeralsTest do
  use ExUnit.Case
  doctest ArabicNumerals

  test "converts 1" do
    assert ArabicNumerals.convert(1) == "I"
  end

  test "converts 4" do
    assert ArabicNumerals.convert(4) == "IV"
  end

  test "converts 5" do
    assert ArabicNumerals.convert(5) == "V"
  end

  test "converts 9" do
    assert ArabicNumerals.convert(9) == "IX"
  end

  test "converts 10" do
    assert ArabicNumerals.convert(10) == "X"
  end

  test "converts 50" do
    assert ArabicNumerals.convert(50) == "L"
  end

  test "converts 100" do
    assert ArabicNumerals.convert(100) == "C"
  end

  test "converts 500" do
    assert ArabicNumerals.convert(500) == "D"
  end

  test "converts 1000" do
    assert ArabicNumerals.convert(1000) == "M"
  end

  test "converts 2" do
    assert ArabicNumerals.convert(2) == "II"
  end

  test "converts 3" do
    assert ArabicNumerals.convert(3) == "III"
  end

  test "converts 7" do
    assert ArabicNumerals.convert(7) == "VII"
  end

  test "converts 18" do
    assert ArabicNumerals.convert(18) == "XVIII"
  end

  test "converts 4827" do
    assert ArabicNumerals.convert(4827) == "MMMMDCCCXXVII"
  end
end
