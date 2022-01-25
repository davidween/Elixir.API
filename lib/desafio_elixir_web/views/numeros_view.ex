defmodule DesafioElixirWeb.NumerosView do
  use DesafioElixirWeb, :view

  def render("getNumerosOrdenados.json", %{page: page}) do
    %{numeros: page}
  end

  def render("getNumerosOrdenados.json", %{msg: msg}) do
    %{error: msg}
  end

end
