class CreateComandas < ActiveRecord::Migration[5.0]
  def change
    create_table :comandas do |t|
      t.references :cliente, foreign_key: true
      t.string :mesa
      t.datetime :data_hora_finalizacao
      t.date :data_sincronizacao
      t.decimal :desconto, precision: 5, scale: 2

      t.timestamps
    end
  end
end
