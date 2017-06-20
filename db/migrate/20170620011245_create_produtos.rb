class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.date :data_cadastro
      t.date :data_sincronizacao

      t.timestamps
    end
  end
end
