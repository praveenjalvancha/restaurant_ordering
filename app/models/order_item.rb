class OrderItem < ApplicationRecord
  validates_presence_of [:price, :name, :category]
  # :price, :name, :category, :quantity
  belongs_to :order
end
