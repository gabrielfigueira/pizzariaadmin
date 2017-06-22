class Comanda < ApplicationRecord
  belongs_to :cliente
  has_many :comandas_itens
end
