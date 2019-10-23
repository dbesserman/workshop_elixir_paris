defmodule RomanNumerals do
  @doc """
  Converts an Arabic numeral into a Roman numeral
  """
  def convert("IX" <> roman), do: 9 + convert(roman)
  def convert("IV" <> roman), do: 4 + convert(roman)
  def convert("I" <> roman), do: 1 + convert(roman)
  def convert("V" <> roman), do: 5 + convert(roman)
  def convert("X" <> roman), do: 10 + convert(roman)
  def convert("L" <> roman), do: 50 + convert(roman)
  def convert("C" <> roman), do: 100 + convert(roman)
  def convert("D" <> roman), do: 500 + convert(roman)
  def convert("M" <> roman), do: 1000 + convert(roman)
  def convert(""), do: 0
end
