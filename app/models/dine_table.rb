class DineTable < ApplicationRecord
	validates :table_number, presence: true, uniqueness: true
	has_one :table_current_order
	STATUS = ['Available', 'Not Available']
  validates :status, inclusion: { in: STATUS, if: proc { |x| x.status.present? },
  	:message    => "must be \'#{STATUS.join(", or ")}\'" }

end
