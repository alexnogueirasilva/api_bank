defmodule ApiBankWeb.UsersControllerTest do
  use ApiBankWeb.ConnCase

  alias UsersController

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
          "cep" => "12345678"
           },
        "message" => "User created successfully"
      }

      assert %{"data" => %{
                    "cep" => "12345678", "cpf" => "12345678901", "email" => "alex@devaction.com.br", "name" => "John Doe"},
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
end
