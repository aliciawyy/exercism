defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: []

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    [elem | list]
  end


  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list) do
    Kernel.length(list)
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    LinkedList.length(list) == 0
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek([]), do: {:error, :empty_list}
  def peek([head | _]) do
    {:ok, head}
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail([]), do: {:error, :empty_list}
  def tail([_ | tail_]) do
    {:ok, tail_}
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop([]), do: {:error, :empty_list}
  def pop([head | tail_]) do
    {:ok, head, tail_}
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    list
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    list
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    Enum.reverse(list) 
  end
end
