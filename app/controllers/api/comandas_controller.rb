class Api::ComandasController < ApiController
  def salvar
    comanda = Comanda.find_by(mesa: parametros_cliente[:mesa])

    if comanda.present?
      comanda.attributes = parametros_comanda
    else
      comanda = Comanda.new(parametros_comanda)
    end

    if ! comanda.save
      render json: {response: "erro"}
    else
      render json: {response: "ok"}
    end
  end

  def excluir
    comanda = Cliente.find_by(cpf: parametros_cliente[:cpf])
    if comanda.destroy
      render json: {response: "ok"}
    else
      render json: {response: "erro"}
    end
  end

  private
    def parametros_comanda
      cliente =  Cliente.find_by(cpf: params[:cpf])
      params.require(:comanda).permit(
        :mesa,
        :data_hora_finalizacao,
        :data_sincronizacao,
        :desconto
      ).merge(
        cliente_id: cliente.id
      )
    end
end
