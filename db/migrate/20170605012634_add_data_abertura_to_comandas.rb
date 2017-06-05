class AddDataAberturaToComandas < ActiveRecord::Migration[5.0]
  def change
    add_column :comandas, :data_abertura, :date_time, after: :mesa
  end
end
