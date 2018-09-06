defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @actions [
    "wink",
    "double blink",
    "close your eyes",
    "jump"
  ]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    reversed_binary_code = to_reversed_binary(code)
    action_list = reversed_binary_code
    |> Enum.zip(@actions)
    |> Enum.map(fn {num, action} -> if num == 1, do: action, else: nil end)
    |> Enum.reject(&is_nil/1)
    if length(reversed_binary_code) > 4 do
      Enum.reverse(action_list)
    else
      action_list
    end
  end

  @spec to_reversed_binary(integer()) :: list(integer())
  def to_reversed_binary(0), do: []
  def to_reversed_binary(code) do
    [rem(code, 2) | to_reversed_binary(div(code, 2))]
  end
end
