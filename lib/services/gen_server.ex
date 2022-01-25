defmodule DesafioElixirWeb.Estado do
  use GenServer

  def init(lista_inicial) do
    {:ok, lista_inicial}

  end

  def handle_call(:get_estado, _from, lista_atual) do
    {:reply, lista_atual, lista_atual}

  end

  def handle_cast({:new_estado, new_lista}, _lista_atual) do
    {:noreply, new_lista}

  end

end
