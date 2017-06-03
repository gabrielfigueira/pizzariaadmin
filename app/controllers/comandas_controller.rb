class ComandasController < ApplicationController
  before_action :set_comanda, only: [:show, :edit, :update, :destroy]
  before_action :load_references, only: [:new, :edit, :create, :update]


  # GET /comandas
  def index
    @comandas = Comanda.all.paginate(page: params[:page], per_page: 25)
  end

  # GET /comandas/1
  def show
  end

  # GET /comandas/new
  def new
    @comanda = Comanda.new
  end

  # GET /comandas/1/edit
  def edit
  end

  # POST /comandas
  def create
    @comanda = Comanda.new(comanda_params)

    if @comanda.save
      redirect_to comandas_path, notice: 'Comanda criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /comandas/1
  def update
    if @comanda.update(comanda_params)
      redirect_to comandas_path, notice: 'Comanda atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /comandas/1
  def destroy
    @comanda.destroy
    redirect_to comandas_path, notice: 'Comanda excluído com sucesso.'
  end

  private
    # Carregar comanda por ID
    def set_comanda
      @comanda = Comanda.find(params[:id])
    end

    # Carregar registros associados
    def load_references
      @clientes = Cliente.all
    end

    # Permitir somente parâmetros úteis
    def comanda_params
      params.require(:comanda).permit(
        :cliente_id,
        :mesa,
        :data_hora_finalizacao,
        :data_sincronizacao,
        :desconto
      )
    end
end
