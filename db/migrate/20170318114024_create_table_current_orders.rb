class CreateTableCurrentOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :table_current_orders do |t|
      t.integer :order_id
      t.integer :dine_table_id

      t.timestamps
    end
  end
end
