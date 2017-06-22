class CreateComandasItens < ActiveRecord::Migration[5.0]
  def change
    create_table :comandas_itens do |t|
      t.references :mesa, foreign_key: true
      t.references :produto, foreign_key: true
      t.integer :quantidade
      t.datetime :data_hora_entrega

      t.timestamps
    end
  end
end
