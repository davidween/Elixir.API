defmodule DesafioElixirWeb.NumerosController do
  use DesafioElixirWeb, :controller

  def getNumerosOrdenados(conn, numero_pagina) do

    inicio = ((numero_pagina - 1) * 50)
    fim = 50

    lista_numeros_ordenados = GenServer.call(:david_GenServer, :get_estado)

    page = Enum.slice(lista_numeros_ordenados, inicio, fim)

    render(conn, "getNumerosOrdenados.json", page: page)
  end

  def is_numero_valido(conn, numero_pagina) do
    case Integer.parse(numero_pagina["numero"], 10) do
      {numero_pagina, _} ->
        if numero_pagina >= 1 do
          getNumerosOrdenados(conn, numero_pagina)

        else
          render(conn, "getNumerosOrdenados.json", msg: "Somente aceitamos números inteiros positivos")
        end

      _         ->
        render(conn, "getNumerosOrdenados.json", msg: "Somente aceitamos números inteiros")
    end

  end

end
