defmodule Teste do
  @moduledoc """
  Documentation for Teste.
  """

  @doc """
  Finding the first unique char occurrence in a string with elixir lang aspects

  ## Examples

      iex> Teste.main("abaabacqweqwe")
      "first unique occurrence: c"

      iex> Teste.main("aba")
      "first unique occurrence: b"

      iex> Teste.main("asdqew")
      "first unique occurrence: a"

      iex> Teste.main("aaaaaaaaaa")
      "no unique occurrences"

      iex> Teste.main("aaaaaaaaaabbbbbbbbbb")
      "no unique occurrences"

      iex> Teste.main("asdqweasdqweasdqwe")
      "no unique occurrences"

  """
  def main(string) do
    expression =
      string
      |> String.codepoints()

    expression
    |> first_unique_char_occurrence

    # expression
    # |> is_balanced?
  end

  def first_unique_char_occurrence([head | tail] = string),
    do: first_unique_char_occurrence(string, [head | tail])

  def first_unique_char_occurrence(_, []), do: "no unique occurrences"

  def first_unique_char_occurrence(string, [head | tail]) do
    if length(string -- [head, head]) == length(string) - 1 do
      "first unique occurrence: #{head}"
    else
      first_unique_char_occurrence(string, tail)
    end
  end

  def is_balanced?(string), do: is_balanced?(string, 0, [])

  def is_balanced?([], 0, _stack), do: true

  def is_balanced?([], _match, _stack), do: false

  def is_balanced?(["(" | tail], match, stack), do: is_balanced?(tail, match + 1, ["(" | stack])

  def is_balanced?([")" | tail], match, [head | stack_tail]) when head == "(",
    do: is_balanced?(tail, match - 1, stack_tail)

  def is_balanced?([")" | _], _, _), do: false

  def is_balanced?(["[" | tail], match, stack), do: is_balanced?(tail, match + 1, ["[" | stack])

  def is_balanced?(["]" | tail], match, [head | stack_tail]) when head == "[",
    do: is_balanced?(tail, match - 1, stack_tail)

  def is_balanced?(["]" | _], _, _), do: false

  def is_balanced?(["{" | tail], match, stack), do: is_balanced?(tail, match + 1, ["{" | stack])

  def is_balanced?(["}" | tail], match, [head | stack_tail]) when head == "{",
    do: is_balanced?(tail, match - 1, stack_tail)

  def is_balanced?(["}" | _], _, _), do: false

  def reverse_words_string(string) do
    String.split(string, " ")
    |> Enum.map(fn word -> String.reverse(word) end)
    |> Enum.join(" ")
  end

  def is_unique_chars_same_amount?(string) do
    occurrences =
      string
      |> String.codepoints()
      |> Enum.reduce(%{}, fn char, acc ->
        Map.update(acc, char, 1, &(&1 + 1))
      end)
      |> Map.values()

    Enum.max(occurrences) == Enum.min(occurrences)
  end

  def first_pair_sum(numbers, sum) do
    Enum.with_index(numbers)
    |> Enum.reduce_while([], fn {x, i}, acc ->
      y = sum - x

      case Enum.find_index(numbers, &(&1 == y)) do
        nil -> {:cont, acc}
        j -> {:halt, [Enum.at(numbers, i), Enum.at(numbers, j)]}
      end
    end)
  end
end
