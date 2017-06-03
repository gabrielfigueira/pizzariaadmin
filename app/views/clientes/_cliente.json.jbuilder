json.extract! cliente, :id, :nome, :cpf, :logradouro, :numero, :bairro, :cep, :cidade, :telefone, :email, :data_sincronizacao, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
