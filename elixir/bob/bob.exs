defmodule Bob do
  def hey(input) do
    cond do
      is_sentence_empty(input) -> "Fine. Be that way!"
      is_question(input) and is_sentence_upcase(input) ->
        "Calm down, I know what I'm doing!"
      is_question(input) -> "Sure."
      is_sentence_upcase(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def is_sentence_empty(input) do
    String.replace(input, " ", "") == ""
  end

  def is_question(input) do
    String.ends_with?(input, "?")
  end

  defp is_word_in(input) do
    String.match?(input, ~r/[a-zA-ZА-Яа-я]/)
  end

  def is_sentence_upcase(input) do
    is_word_in(input) and String.upcase(input) == input
  end
end
