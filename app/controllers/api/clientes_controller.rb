class Api::ClientesController < ApiController

  def salvar
    cliente = Cliente.find_by(cpf: parametros_cliente[:cpf])

    if cliente.present?
      cliente.attributes = parametros_cliente
    else
      cliente = Cliente.new(parametros_cliente)
    end
    cliente.attributes = parametros_cliente

    if ! cliente.save
      render json: {response: "erro"}
    else
      render json: {response: "ok"}
    end
  end

  def excluir
    cliente = Cliente.find_by(cpf: parametros_cliente[:cpf])
    if cliente.destroy
      render json: {response: "ok"}
    else
      render json: {response: "erro"}
    end
  end

  private
    def parametros_cliente
      params.require(:cliente).permit(
        :nome,
        :cpf,
        :logradouro,
        :numero,
        :bairro,
        :cep,
        :cidade,
        :telefone,
        :email,
        :data_cadastro,
        :data_sincronizacao
      )
    end
end
