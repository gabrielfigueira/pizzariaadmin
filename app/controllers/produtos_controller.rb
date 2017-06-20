class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  

  # GET /produtos
  def index
    @produtos = Produto.all.paginate(page: params[:page], per_page: 25)
  end

  # GET /produtos/1
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      redirect_to produtos_path, notice: 'Produto criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /produtos/1
  def update
    if @produto.update(produto_params)
      redirect_to produtos_path, notice: 'Produto atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy
    redirect_to produtos_path, notice: 'Produto excluído com sucesso.'
  end

  private
    # Carregar produto por ID
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Permitir somente parâmetros úteis
    def produto_params
      params.require(:produto).permit(:descricao, :data_cadastro, :data_sincronizacao)
    end
end
