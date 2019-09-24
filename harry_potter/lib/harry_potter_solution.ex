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
    combination_maximising_biggest_set = combination_maximising_biggest_set(books_list)
    optimal_number_of_sets = length(combination_maximising_biggest_set)
    [combination_maximising_biggest_set, combination_maximising_smallest_set(books_list, optimal_number_of_sets)]
  end


  defp combination_maximising_biggest_set(books_list) do
    combination_maximising_biggest_set([], books_list)
  end

  defp combination_maximising_biggest_set(combinations, []) do
    combinations
  end

  defp combination_maximising_biggest_set(combinations, remaining_books) do
    new_combination = Enum.uniq(remaining_books)
    
    combination_maximising_biggest_set(
      combinations ++ [new_combination],
      remaining_books -- new_combination
    )
  end
  
  def combination_maximising_smallest_set(books_list, optimal_number_of_sets) do
    empty_sets = Enum.map(1..optimal_number_of_sets, fn _ -> [] end) 

    combination_maximising_smallest_set(empty_sets, 0, reordered_book_list(books_list))
  end

  def combination_maximising_smallest_set(sets, _, []) do
    sets
  end

  def combination_maximising_smallest_set(sets, index_of_set_to_be_populated, ordered_book_list) do
    [book_to_be_added_to_set | remaining_books] = ordered_book_list
    populated_set = [book_to_be_added_to_set | Enum.at(sets, index_of_set_to_be_populated)]
    updated_sets = List.replace_at(sets, index_of_set_to_be_populated, populated_set)
    next_set_index = rem(index_of_set_to_be_populated + 1, length(sets))

    combination_maximising_smallest_set(updated_sets, next_set_index, remaining_books)
  end

  def reordered_book_list(books_list) do
    Enum.sort_by(
      books_list,
      fn tome_index -> HarryPotter.book_count(books_list, tome_index) end,
      &>=/2
    )
  end

  def book_count(books_list, tome_index) do
    Enum.count(books_list, fn n -> n == tome_index end)
  end

  def combinations_set_price(combinations_set) do
    combinations_set
    |> Enum.map(fn combination -> HarryPotter.combination_price(combination) end)
    |> Enum.sum()
  end

  def combination_price(books_list) when length(books_list) == 0 do
    0
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
