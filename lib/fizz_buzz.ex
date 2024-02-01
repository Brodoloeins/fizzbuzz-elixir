defmodule FizzBuzz do
  def build(file_name) do

    file_name
    |> File.read()
    |> handle_file_read()
  end

  # Se for enviado um nome de arquivo correto
  defp handle_file_read({:ok, result}) do
    result =
      result
      |>String.split(",")# Transformando em lista
      |>Enum.map(&convert_and_evaluate_numbers/1)# Transformando a lista em inteiro ao invés de String

    {:ok, result}
  end

  # Se for enviado um nome de arquivo incorreto
  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(num) when rem(num, 3) == 0 and rem(num, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(num) when rem(num, 3) == 0, do: :fizz
  defp evaluate_numbers(num) when rem(num, 5) == 0, do: :buzz
  defp evaluate_numbers(num), do: num

end
