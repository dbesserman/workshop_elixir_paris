defmodule HarryPotterTest do
  use ExUnit.Case
  doctest HarryPotter

  test "price of an empty cart" do
    assert HarryPotter.price([]) == 0
  end

  @tag :skip
  test "cart with the first tome" do
    assert HarryPotter.price([1]) == 8
  end

  @tag :skip
  test "cart with the second tome" do
    assert HarryPotter.price([2]) == 8
  end

  @tag :skip
  test "cart with the third tome" do
    assert HarryPotter.price([3]) == 8
  end

  @tag :skip
  test "cart with the fourth tome" do
    assert HarryPotter.price([4]) == 8
  end

  @tag :skip
  test "cart with two different books" do
    expected_total = 8 * 2 * 0.95 # 15.2

    assert HarryPotter.price([0, 1]) ==  expected_total
  end

  @tag :skip
  test "cart with three different books" do
    expected_total = 8 * 3 * 0.9 # 21.6

    assert HarryPotter.price([0, 2, 4]) == expected_total
  end

  @tag :skip
  test "cart with four different books" do
    expected_total = 8 * 4 * 0.8 # 25.6

    assert HarryPotter.price([0, 1, 2, 4]) == expected_total
  end

  @tag :skip
  test "cart with five different books" do
    expected_total = 8 * 5 * 0.75 # 30

    assert HarryPotter.price([0, 1, 2, 3, 4]) == expected_total
  end

  @tag :skip
  test "cart with two different books one of which has two copies" do
    expected_total = 8 + (8 * 2 * 0.95) # 23.2

    assert HarryPotter.price([0, 0, 1]) == expected_total
  end

  @tag :skip
  test "cart with two different books each one having two copies" do
    expected_total =  2 * (8 * 2 * 0.95) # 34.2

    assert HarryPotter.price([0, 0, 1, 1]) == expected_total
  end

  @tag :skip
  test "cart with four different books, two of which have two copies" do
    expected_total = (8 * 4 * 0.8) + (8 * 2 * 0.95) # 40.8

    assert HarryPotter.price([0, 0, 1, 2, 2, 3]) == expected_total
  end

  @tag :skip
  test "cart with five different books, one of which have two copies" do
    expected_total = 8 + (8 * 5 * 0.75) # 38
    assert HarryPotter.price([0, 1, 1, 2, 3, 4]) == expected_total
  end

  @tag :skip
  test "cart with five different books, three of which have two copies" do
    expected_total = (8 * 3 * 0.9) + (8 * 5 * 0.75) # 51.6

    assert HarryPotter.price([0, 0, 1, 1, 2, 2, 3, 4]) == expected_total
  end

  @tag :skip
  test "cart with 5 different books, 3 of which have 5 copies and 2 having 4 copies" do
    expected_total =  4 * (8 * 5 * 0.75) + (8 * 3 * 0.9) # 141,6
    cart = [
      0, 0, 0, 0, 0,
      1, 1, 1, 1, 1,
      2, 2, 2, 2,
      3, 3, 3, 3, 3,
      4, 4, 4, 4
    ]

    assert HarryPotter.price(cart) == expected_total
  end
end
