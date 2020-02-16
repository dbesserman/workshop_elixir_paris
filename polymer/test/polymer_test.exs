defmodule PolymerTest do
  use ExUnit.Case
  doctest Polymer

  test "no reaction when 2 adjacent elements have different unit types and different polarity" do
    assert Polymer.combination_after_reactions("ab") == "ab"
  end

  @tag :skip
  test "no reaction when 2 adjacent elements the same unit types and the same polarity" do
    assert Polymer.combination_after_reactions("aa") == "aa"
  end

  @tag :skip
  test "reaction happens when 2 adjacent elements have the same unit types and different polarity" do
    assert Polymer.combination_after_reactions("aA") == ""
  end

  @tag :skip
  test "the order of the polymer does not matter for the reaction" do
    assert Polymer.combination_after_reactions("Aa") == ""
  end

  @tag :skip
  test "a reaction can trigger another reaction" do
    assert Polymer.combination_after_reactions("abBA") == ""
  end

  @tag :skip
  test "a reaction can trigger many reaction" do
    assert Polymer.combination_after_reactions("fedcabBACDEF") == ""
  end

  @tag :skip
  test "a reaction is performed after removing the unit that prevents an optimal combination" do
    assert Polymer.combination_after_optimization_and_reactions("dabAcCaCBAcCcaDA") == "daDA"
  end
end
