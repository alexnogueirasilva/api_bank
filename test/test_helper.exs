# In your test/test_helper.exs
Mox.defmock(ApiBank.ViaCep.ClientMock, for: ApiBank.ViaCep.ClientBehaviour) # <- Add this
Application.put_env(:api_bank, :via_cep_client, ApiBank.ViaCep.ClientMock) # <- Add this

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ApiBank.Repo, :manual)
