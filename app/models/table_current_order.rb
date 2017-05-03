class TableCurrentOrder < ApplicationRecord
	belongs_to :dine_table
	belongs_to :order

end
