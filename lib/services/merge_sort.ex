defmodule DesafioElixirWeb.Merge_Sort do

  def sort([]) do
    []
  end

  def sort([i]) do
    [i]
  end

  def sort(lista) do
    tamanho = round(length(lista) / 2)

    {esquerda, direita} = Enum.split(lista, tamanho)  # [1, 2, 3, 4, 5, 6] -> {[1, 2], [3, 4, 5, 6]}

    merge(sort(esquerda), sort(direita))
  end

  def merge([], []) do
    []
  end

  def merge(x, []) do
    x
  end

  def merge([], y) do
    y
  end

  def merge([head_1 | tail_1], [head_2 | tail_2]) when head_1 < head_2 do
    [head_1 | merge(tail_1, [head_2 | tail_2])]
  end

  def merge([head_1 | tail_1], [head_2 | tail_2]) when head_1 >= head_2 do
    [head_2 | merge([head_1 | tail_1], tail_2)]
  end

end
