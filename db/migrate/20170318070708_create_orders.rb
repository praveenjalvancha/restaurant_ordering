class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_state
      t.references :dine_table, foreign_key: true

      t.timestamps
    end
  end
end
