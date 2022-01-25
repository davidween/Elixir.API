defmodule DesafioElixirWeb.ErrorMerge_SortTest do
  use DesafioElixirWeb.ConnCase, async: true

  test "ordenação lista" do
    assert DesafioElixirWeb.Merge_Sort.sort([9, 4, 5, 7, 7]) == [4, 5, 7, 7, 9]
  end

  test "ordenação lista vazia" do
    assert DesafioElixirWeb.Merge_Sort.sort([]) == []
  end

  test "ordenação lista de 1 elemento" do
    assert DesafioElixirWeb.Merge_Sort.sort([10]) == [10]
  end

  test "ordenação lista ordenada" do
    assert DesafioElixirWeb.Merge_Sort.sort([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
  end

end
