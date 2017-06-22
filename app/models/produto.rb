class Produto < ApplicationRecord
  has_many :comandas_itens
end
