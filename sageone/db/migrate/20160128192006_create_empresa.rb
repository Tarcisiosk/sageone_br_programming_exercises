class CreateEmpresa < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
    	t.string :razao_social
    	t.text :nome_fantasia
    	t.timestamps null: false
    end
  end
end
