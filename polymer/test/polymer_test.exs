defmodule PolymerTest do
  use ExUnit.Case
  doctest Polymer

  test "no reaction when 2 adjacent elements have different unit types and different polarity" do
    assert Polymer.perform_reaction("ab") == "ab"
  end

  @tag :skip
  test "no reaction when 2 adjacent elements the same unit types and the same polarity" do
    assert Polymer.perform_reaction("aa") == "aa"
  end

  @tag :skip
  test "reaction happens when 2 adjacent elements have the same unit types and different polarity" do
    assert Polymer.perform_reaction("aA") == ""
  end

  @tag :skip
  test "the order of the polymer does not matter for the reaction" do
    assert Polymer.perform_reaction("Aa") == ""
  end

  @tag :skip
  test "a reaction can trigger another reaction" do
    assert Polymer.perform_reaction("abBA") == ""
  end

  @tag :skip
  test "a reaction can trigger many reaction" do
    assert Polymer.perform_reaction("fedcabBACDEF") == ""
  end
end
