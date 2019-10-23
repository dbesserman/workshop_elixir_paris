defmodule ArabicNumerals do
  @doc """
  Converts a Roman numeral into  an Arabic numeral
  """
  def convert(4), do: "IV"
  def convert(9), do: "IX"
  def convert(arabic) when arabic >= 1000, do: "M" <> convert(arabic - 1000)
  def convert(arabic) when arabic >= 500, do: "D" <> convert(arabic - 500)
  def convert(arabic) when arabic >= 100, do: "C" <> convert(arabic - 100)
  def convert(arabic) when arabic >= 50, do: "L" <> convert(arabic - 50)
  def convert(arabic) when arabic >= 10, do: "X" <> convert(arabic - 10)
  def convert(arabic) when arabic >= 5, do: "V" <> convert(arabic - 5)
  def convert(arabic) when arabic >= 1, do: "I" <> convert(arabic - 1)
  def convert(0), do: ""
end
