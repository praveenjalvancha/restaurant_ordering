class Waiter < ApplicationRecord
  validates :name, presence: true
  validates_presence_of :e_id, uniqueness: true, message: "Id Can't be blank"
  has_many :orders
end
