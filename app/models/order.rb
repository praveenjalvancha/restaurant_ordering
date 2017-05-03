class Order < ApplicationRecord
	has_many :order_items  
	belongs_to :dine_table
	belongs_to :waiter

	def total_items_price
		order_items.map(&:price).sum
	end

	class << self

		def get_only_settled
			where(order_state: "Settled")
		end

		def by_category(category, date='')
			category = category == 'All' ? ['Food', 'Drinks'] : category
			records = date.blank? ? get_only_settled.where(category: category) : get_only_settled.where(category: category).where("DATE(created_at)" , date)
		end
	end
end
