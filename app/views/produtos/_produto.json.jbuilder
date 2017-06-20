json.extract! produto, :id, :descricao, :data_cadastro, :data_sincronizacao, :created_at, :updated_at
json.url produto_url(produto, format: :json)
