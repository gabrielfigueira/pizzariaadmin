class ComandaItem < ApplicationRecord
  belongs_to :mesa
  belongs_to :produto
end
