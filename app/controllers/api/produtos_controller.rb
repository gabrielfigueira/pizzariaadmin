class Api::ProdutosController < ApiController
  before_action :parametros_uteis, only: [:salvar, :excluir]

  def salvar
    parametros = {
      descricao: params[:descricao],
      data_sincronizacao: params[:data_sincronizacao]
    }
    produto = Produto.find_by(cpf: params[:cpf])

    if produto.present?
      produto.attributes = parametros
    else
      produto = Produto.new(parametros)
    end
    produto.attributes = parametros

    if ! produto.save
      render json: {response: "-1"}
    else
      render json: {response: "#{produto.id}"}
    end
  end

  def excluir
    produto = Cliente.find_by(cpf: params[:cpf])
    if produto.destroy
      render json: {response: "ok"}
    else
      render json: {response: "erro"}
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
