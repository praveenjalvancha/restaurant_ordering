class AddCapacityToDineTables < ActiveRecord::Migration[5.0]
  def change
    add_column :dine_tables, :capacity, :integer, default: 4
  end
end
