class AddDataAberturaToComandasv2 < ActiveRecord::Migration[5.0]
  def change
    add_column :comandas, :data_abertura, :datetime, after: :mesa
  end
end
