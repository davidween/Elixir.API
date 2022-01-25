defmodule DesafioElixirWeb.API do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://challenge.dienekes.com.br/api"
  plug Tesla.Middleware.JSON

  def get_pagina(numero_pagina) do
    lista = get("numbers?page=#{numero_pagina}") |> tratar_resposta()

    get_pagina(numero_pagina + 1, lista)

  end

  def get_pagina(numero_pagina, lista) do
    lista_atual = get("numbers?page=#{numero_pagina}") |> tratar_resposta()

    IO.puts(numero_pagina)

    case lista_atual do
      [] ->
        lista = DesafioElixirWeb.Merge_Sort.sort(lista)
        {:ok, _pid} = GenServer.start_link(DesafioElixirWeb.Estado, lista, name: :david_GenServer)

      ['Falha'] ->
        lista = lista ++ lista_atual
        get_pagina(numero_pagina, lista)

      _ ->
        lista = lista ++ lista_atual
        get_pagina(numero_pagina + 1, lista)

    end

  end

  def tratar_resposta({:ok, %Tesla.Env{status: 200, body: body}}) do
    body["numbers"]
    # body_decode = Jason.decode!(body)  # {:ok, %{"numbers" => [1, 2, 3...]}}
    # (elem(body_decode, 1))["numbers"]

  end

  def tratar_resposta({:ok, %Tesla.Env{status: status}}) when status >= 201 do
    ['Falha']

  end

end
