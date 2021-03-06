class Api::ClientesController < ApiController
  before_action :parametros_uteis, only: [:salvar, :excluir]

  def salvar
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
    cliente = Cliente.find_by(cpf: params[:cpf])

    if cliente.present?
      cliente.attributes = parametros
    else
      cliente = Cliente.new(parametros)
    end
    cliente.attributes = parametros

    if ! cliente.save
      render json: {response: "-1"}
    else
      render json: {response: "#{cliente.id}"}
    end
  end

  def excluir
    cliente = Cliente.find_by(cpf: params[:cpf])
    if cliente.destroy
      render json: {response: "#{cliente.id}"}
    else
      render json: {response: "-1"}
    end
  end

  def parametros_uteis
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
    p parametros
  end
end
