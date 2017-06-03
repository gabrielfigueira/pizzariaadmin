class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :logradouro
      t.integer :numero
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :telefone
      t.string :email
      t.date :data_sincronizacao

      t.timestamps
    end
  end
end
