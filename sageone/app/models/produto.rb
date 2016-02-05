class Produto < ActiveRecord::Base
   
   	def self.import(file)
	 	produtos_importados = Array.new
		#CSV
	 	if File.extname(file.path) == ".csv"
		 	CSV.foreach(file.path, headers:true, col_sep: ';', :encoding => 'ISO-8859-1') do |row|
			   	produto = Produto.new(
					categoria: row['Categoria'],
					unidade: row['Unidade'],
					descricao: row['Descrição'],
					identificacao: row['Identificação'],
					custo: row['Custo'],
					preco_venda1: row['Preço de Venda 1'],
					observacoes: row['Observaçőes'],
					fornecedor: row['Fornecedor'],
					estoque: row['Estoque'],
					cod_barra: row['Cód. Barra'],
					preco_venda2: row['Preço de Venda 2'],
					preco_venda3: row['Preço de Venda 3'],
					estoque_min: row['Estoque Mínimo'],
					estoque_max: row['Estoque Máximo'],
					estoque_compra: row['Estoque Compra'],
					fator_unid_venda: row['Fator unid. de venda'],
					ncm: row['NCM'],
					marca: row['Marca'],
					peso: row['Peso'],
					tamanho: row['Tamanho'],
					inativo: row['Inativo'],
					tipo: row['Tipo'],
					composicao: row['Composição'],
					mat_prima: row['Matéria Prima'],
					mat_exp: row['Material Expediente'],
					para_venda: row['Para Venda'],
					moeda: row['Moeda']
			   )
			   produtos_importados.push(produto)
			end
	 	#TXT
		elsif File.extname(file.path) == ".txt"
		 	cols = Array.new
		 	File.open(file.path, "r").each do |line|
		  		if line.first == "I"
		  			prod = line.split('|')
		  			produto = Produto.new(
						descricao: prod[2],
						cod_barra: prod[9] || prod[3],
						ncm: prod[4],
						unidade: prod[10] || prod[7],
						custo: prod[11] || prod[8],
						identificacao: prod[1],
						estoque: prod[12]
			   		)
			   		produtos_importados.push(produto)
		  		end
			end
		end

		Produto.transaction do
			produtos_importados.each do |produto|
				if produto.valid?
			   		produto.save
				else
					puts "FALHOU"
					raise ActiveRecord::Rollback, product.errors 
				end
			end
		end
    end
end
