defmodule ApiBank.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  alias ApiBank.ViaCep.Client

  describe "call/1" do
    test "successfully returns cep info", %{bypass: bypass} do
      cep = "44090778"

      body = ~s({
        "bairro": "Tomba",
        "cep": "44090-778",
        "complemento": "",
        "ddd": "75",
        "gia": "",
        "ibge": "2910800",
        "localidade": "Feira de Santana",
        "logradouro": "Rua Trigêmeos",
        "siafi": "3515",
        "uf": "BA"
      })

      expected_response =
        {:ok,
          %{
            "bairro" => "Tomba",
            "cep" => "44090-778",
            "complemento" => "",
            "ddd" => "75",
            "gia" => "",
            "ibge" => "2910800",
            "localidade" => "Feira de Santana",
            "logradouro" => "Rua Trigêmeos",
            "siafi" => "3515",
            "uf" => "BA"
          }
        }

      Bypass.expect(bypass, fn conn ->
      conn
      |> Plug.Conn.put_resp_content_type("application/json")
      |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.call(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}/"
end
