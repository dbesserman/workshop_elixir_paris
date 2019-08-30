defmodule HarryPotter do
  @moduledoc """
  Documentation for HarryPotter.
  """

  def price(books_list) do
    books_list
    |> combinations_sets()
    |> Enum.map(fn combinations_set -> HarryPotter.combinations_set_price(combinations_set) end)
    |> Enum.min()
  end

  def combinations_sets(books_list) do
    [combination_maximising_biggest_set(books_list), combination_maximising_smallest_set(books_list)]
  end


  defp combination_maximising_biggest_set(books_list) do
    combination_maximising_biggest_set([], books_list)
  end

  defp combination_maximising_biggest_set(distinct_combination_lists, []) do
    distinct_combination_lists
  end

  defp combination_maximising_biggest_set(combinations, remaining_books) do
    new_combination = Enum.uniq(remaining_books)
    
    combination_maximising_biggest_set(
      combinations ++ [new_combination],
      remaining_books -- new_combination
    )
  end
  
  def combination_maximising_smallest_set(books_list) do
    last_set_index = optimal_number_of_sets(books_list) - 1

    0..last_set_index
    |> Enum.each(fn _ -> [] end)
  end

  def individual_books_count(books_list) do
    books_list
    |> Enum.uniq()
    |> Enum.map(
      fn tome_index ->
        {
          tome_index,
          Enum.count(books_list, fn n -> n == tome_index end)
        }
      end
    )
    |> Map.new()
    |> Enum.sort_by(fn book_tupple -> HarryPotter.book_count(book_tupple) end, &>=/2)
  end

  def book_count(book_tupple) do
    {_book_index, count} = book_tupple

    count
  end

  defp optimal_number_of_sets(books_list) do
    books_list
    |> Enum.uniq()
    |> length()
  end

  def combinations_set_price(combinations_set) do
    combinations_set
    |> Enum.map(fn combination -> HarryPotter.combination_price(combination) end)
    |> Enum.sum()
  end

  def combination_price(books_list) when length(books_list) == 1 do
    8
  end

  def combination_price(books_list) when length(books_list) == 2 do
    15.2
  end

  def combination_price(books_list) when length(books_list) == 3 do
    21.6
  end

  def combination_price(books_list) when length(books_list) == 4 do
    25.6
  end

  def combination_price(books_list) when length(books_list) == 5 do
    30
  end
end
