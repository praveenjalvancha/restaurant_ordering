class AddPriceToMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_items, :price, :float
  end
end
