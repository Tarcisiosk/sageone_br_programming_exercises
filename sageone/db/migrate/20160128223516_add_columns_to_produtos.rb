class AddColumnsToProdutos < ActiveRecord::Migration
  def change
	add_column :produtos, :unidade, :string
	add_column :produtos, :descricao, :string
	add_column :produtos, :identificacao, :string
	add_column :produtos, :custo, :float
	add_column :produtos, :preco_venda1, :float
	add_column :produtos, :preco_venda2, :float
	add_column :produtos, :preco_venda3, :float
	add_column :produtos, :observacoes, :text
	add_column :produtos, :fornecedor, :string
	add_column :produtos, :estoque, :integer
	add_column :produtos, :estoque_min, :integer
	add_column :produtos, :estoque_max, :integer
	add_column :produtos, :estoque_compra, :integer
	add_column :produtos, :cod_barra, :numeric
	add_column :produtos, :fator_unid_venda, :float
	add_column :produtos, :ncm, :string
	add_column :produtos, :marca, :string
	add_column :produtos, :peso, :float
	add_column :produtos, :tamanho, :float
	add_column :produtos, :inativo, :bool
	add_column :produtos, :tipo, :string
	add_column :produtos, :categoria, :string
	add_column :produtos, :composicao, :string
	add_column :produtos, :mat_prima, :string
	add_column :produtos, :mat_exp, :string
	add_column :produtos, :para_venda, :bool
	add_column :produtos, :moeda, :string
  end
end
