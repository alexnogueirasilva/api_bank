defmodule ApiBankWeb.UsersControllerTest do
  use ApiBankWeb.ConnCase

  alias UsersController
  alias ApiBank.Users

  @moduletag :capture_log

  describe "create/2" do
    test "when the user is created successfully", %{conn: conn} do
      user_params = %{
        "name" => "John Doe",
        "email" => "alex@devaction.com.br",
        "cpf" => "12345678901",
        "cep" => "12345678",
        "password" => "12345678"
      }
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
