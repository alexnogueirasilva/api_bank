defmodule ApiBank.ViaCep.ClientBehaviour do
  @moduledoc """
  This module is responsible for the via cep behavior.
  """
  @callback call(String.t()) :: {:ok, map()} | {:error, :atom}
end
