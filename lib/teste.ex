defmodule Teste do
  @moduledoc """
  Documentation for Teste.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Teste.hello()
      :world

  """
  def main(string) do
    String.codepoints(string)
    |> first_unique_char_occurrence
  end

  def first_unique_char_occurrence([head | tail] = string) do
    first_unique_char_occurrence(string, [head | tail])
  end

  def first_unique_char_occurrence(_, []), do: "no unique occurrences"

  def first_unique_char_occurrence(string, [head | tail]) do
    if length(string -- [head, head]) == length(string) - 1 do
      "first unique occurrence: #{head}"
    else
      first_unique_char_occurrence(string, tail)
    end
  end
end
