defmodule ApiBankWeb.UsersControllerTest do
  use ApiBankWeb.ConnCase

  import Mox

  alias UsersController
  alias ApiBank.Users
  alias ApiBank.ViaCep.ClientMock

  @moduletag :capture_log
  setup do
    params = %{
      "name" => "John Doe",
      "email" => "alex@devaction.com.br",
      "cpf" => "12345678901",
      "cep" => "12345678",
      "password" => "12345678"
    }

    body = %{
      "name" => "John Doe",
      "email" => "alex@devaction.com.br",
      "cpf" => "12345678901",
      "cep" => "12345678",
      "password" => "12345678"
    }

    {:ok, %{params: params, body: body}}
  end

  describe "create/2" do
    test "when the user is created successfully", %{conn: conn, body: body, params: user_params} do
      
      expect(ClientMock, :call, fn "12345678" ->
        {:ok, body}
      end)
      
      response =
        conn
        |> post(~p"/api/users", user_params)
        |> json_response(:created)

      assert response == %{
        "data" => %{
          "name" => "John Doe",
          "email" => "alex@devaction.com.br",
          "cpf" => "12345678901",
          "cep" => "12345678",
          "id" => response["data"]["id"]
           },
        "message" => "User created successfully"
      }

      assert %{"data" => %{
                    "cep" => "12345678",
                    "cpf" => "12345678901",
                    "email" => "alex@devaction.com.br",
                    "name" => "John Doe",
                    "id" => _id
             },
                    "message" => "User created successfully"
             } = response
      end

    test "when the user is not created successfully", %{conn: conn} do
        user_params = %{
          "name" => "John Doe",
          "email" => "",
          "cpf" => "",
          "cep" => "12345678",
          "password" => ""
        }

        expect(ClientMock, :call, fn "12345678" ->
          {:ok, ""}
        end)

        response =
          conn
          |> post(~p"/api/users", user_params)
          |> json_response(:bad_request)

        assert response == %{
          "errors" => %{
            "email" => ["can't be blank"],
            "cpf" => ["can't be blank"],
            "password" => ["can't be blank"]
          }
      }
      end
  end

  describe "delete/2" do
    test "when the user is deleted successfully", %{conn: conn} do
      params = %{
        "name" => "John Doe",
        "email" => "alex@devaction.com.br",
        "cpf" => "12345678901",
        "cep" => "12345678",
        "password" => "12345678"
      }

      body = %{
        "name" => "John Doe",
        "email" => "alex@devaction.com.br",
        "cpf" => "12345678901",
        "cep" => "12345678",
        "password" => "12345678"
      }

      expect(ClientMock, :call, fn "12345678" ->
        {:ok, body}
      end)

      {:ok, user} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{user.id}")
        |> json_response(:ok)

        expected_response = %{"data" => %{
          "cep" => "12345678",
          "cpf" => "12345678901",
          "email" => "alex@devaction.com.br",
          "name" => "John Doe", "id" => user.id
        },
          "message" => "User deleted successfully"
        }

        assert response == expected_response
    end
  end
end
