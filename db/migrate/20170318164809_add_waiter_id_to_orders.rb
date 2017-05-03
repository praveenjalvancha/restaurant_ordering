class AddWaiterIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :waiter_id, :integer
  end
end
