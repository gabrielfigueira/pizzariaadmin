class Api::ComandasController < ApiController
  before_action :parametros_comanda, only: [:salvar]
  def salvar
      parametros = {
        cliente_id: 1,
        mesa: params[:mesa],
        data_abertura: params[:data_abertura],
        data_hora_finalizacao: params[:data_hora_finalizacao],
        data_sincronizacao: params[:data_sincronizacao],
        desconto: params[:desconto]
      }
    comanda = Comanda.find_by(mesa: parametros[:mesa])

    if comanda.present?
      comanda.attributes = parametros
    else
      comanda = Comanda.new(parametros)
    end

    if ! comanda.save
      render json: {response: "-1"}
    else
      render json: {response: "#{comanda.id}"}
    end
  end

  def excluir
    comanda = Comanda.find_by(mesa: parametros_comanda[:mesa])
    if comanda.destroy
      render json: {response: "#{comanda.id}"}
    else
      render json: {response: "-1"}
    end
  end

  def itens_comandas
    comanda = Comanda.id(params[:id_centralizado])
    comanda.destroy_all
    comanda.comandas_itens

  end

  private
    def parametros_comanda
      cliente =  Cliente.find_by(cpf: params[:cpf])
      # params.require(:comanda).permit(
      #   :mesa,
      #   :data_abertura,
      #   :data_hora_finalizacao,
      #   :data_sincronizacao,
      #   :desconto
      # ).merge(
      #   cliente_id: cliente.id
      # )
      parametros = {
        mesa: params[:mesa],
        data_abertura: params[:data_abertura],
        data_hora_finalizacao: params[:data_hora_finalizacao],
        data_sincronizacao: params[:data_sincronizacao],
        desconto: params[:desconto]
      }
      # :mesa,
      # :data_abertura,
      # :data_hora_finalizacao,
      # :data_sincronizacao,
      # :desconto
    end
end
