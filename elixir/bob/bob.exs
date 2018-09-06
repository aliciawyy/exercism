defmodule Bob do
  def hey(input) do
    cond do
      String.replace(input, " ", "") == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") ->
        if String.upcase(input) == input and String.match?(input, ~r/[a-zA-Z]/)
        do
          "Calm down, I know what I'm doing!"
        else
          "Sure."
        end
      not String.match?(input, ~r/[a-zA-Z]/)
      and String.match?(input, ~r/[0-9]/) -> "Whatever."
      String.match?(input, ~r/[0-9%^*@#$(*^]/) -> "Whoa, chill out!"
      String.upcase(input) == input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
