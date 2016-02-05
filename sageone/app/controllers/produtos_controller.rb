require 'csv'    

class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

 def import
    if !params[:file]
         redirect_to root_path, notice: 'Nenhum arquivo selecionado'
    else
      file = params[:file]
      if File.extname(file.path) == ".csv" || File.extname(file.path) == ".txt"
        Produto.import(params[:file])
        redirect_to root_path, notice: 'Produtos importados com sucesso.'
      else
        redirect_to root_path, notice: 'Formato de arquivo não suportado'
      end
    end
 end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto criado com sucesso' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto alterado com sucesso' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

 #import
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:categoria, :unidade, :descricao, :identificacao, :custo, :preco_venda1, :observacoes, :fornecedor, :estoque, :cod_barra, :preco_venda2, :preco_venda3, :estoque_min, :estoque_max, :estoque_compra, :fator_unid_venda, :ncm, :marca, :peso, :tamanho, :inativo, :tipo, :composicao, :mat_prima, :mat_exp, :para_venda, :moeda)
    end
end
