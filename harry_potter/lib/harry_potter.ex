defmodule HarryPotter do
  @moduledoc """
  Once upon a time there was a series of 5 books about a very English hero called Harry. (At least when this Kata was invented,
  there were only 5. Since then they have multiplied) Children all over the world thought he was fantastic, and, of course,
  so did the publisher. So in a gesture of immense generosity to mankind, (and to increase sales) they set up the following
  pricing model to take advantage of Harry’s magical powers.

  One copy of any of the five books costs 8 EUR. If, however, you buy two different books from the series, you get a 5% discount
  on those two books. If you buy 3 different books, you get a 10% discount. With 4 different books, you get a 20% discount.
  If you go the whole hog, and buy all 5, you get a huge 25% discount.

  Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set,
  but the fourth book still costs 8 EUR.

  Potter mania is sweeping the country and parents of teenagers everywhere are queueing up with shopping baskets overflowing with
  Potter books. Your mission is to write a piece of code to calculate the price of any conceivable shopping basket,
  giving as big a discount as possible.
  """

  def rate_for_serie_size(1), do: 1
  def rate_for_serie_size(2), do: 0.95
  def rate_for_serie_size(3), do: 0.90
  def rate_for_serie_size(4), do: 0.8
  def rate_for_serie_size(5), do: 0.75

  def serie_price(list) do
    quantity   = length(list)
    base_price = 8

    base_price * quantity * rate_for_serie_size(quantity)
  end

  def price([]), do: 0
  def price(book_list) do
    uniq_list =
      book_list
      |> Enum.uniq() # Biggest set of unique books

    serie_price(uniq_list) + price(book_list -- uniq_list)

  end
end
