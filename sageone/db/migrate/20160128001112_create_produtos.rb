class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|

      t.timestamps null: false
    end
  end
end
