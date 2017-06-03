class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  

  # GET /clientes
  def index
    @clientes = Cliente.all.paginate(page: params[:page], per_page: 25)
  end

  # GET /clientes/1
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to clientes_path, notice: 'Cliente criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      redirect_to clientes_path, notice: 'Cliente atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /clientes/1
  def destroy
    @cliente.destroy
    redirect_to clientes_path, notice: 'Cliente excluído com sucesso.'
  end

  private
    # Carregar cliente por ID
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Permitir somente parâmetros úteis
    def cliente_params
      params.require(:cliente).permit(:nome, :cpf, :logradouro, :numero, :bairro, :cep, :cidade, :telefone, :email, :data_sincronizacao)
    end
end
