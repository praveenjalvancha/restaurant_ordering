class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.string :name
      t.float :price
      t.string :category
      t.integer :quantity

      t.timestamps
    end
  end
end
