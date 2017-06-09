class Api::ClientesController < ApiController

  def salvar
    cliente = Cliente.find_by(cpf: params[:cpf])

    parametros = {
      nome: params[:nome],
      cpf: params[:cpf],
      logradouro: params[:logradouro],
      numero: params[:numero],
      bairro: params[:bairro],
      cep: params[:cep],
      cidade: params[:cidade],
      telefone: params[:telefone],
      email: params[:email],
      data_sincronizacao: params[:data_sincronizacao]
    }

    if cliente.present?
      cliente.attributes = parametros
    else
      cliente = Cliente.new(parametros)
    end
    cliente.attributes = parametros

    if ! cliente.save
      render json: {response: "erro"}
    else
      render json: {response: "ok"}
    end
  end

  def excluir
    cliente = Cliente.find_by(cpf: parametros[:cpf])
    if cliente.destroy
      render json: {response: "ok"}
    else
      render json: {response: "erro"}
    end
  end
end
