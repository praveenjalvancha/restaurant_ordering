class CreateDineTables < ActiveRecord::Migration[5.0]
  def change
    create_table :dine_tables do |t|
      t.string :table_number
      t.string :status, default: 'Available'

      t.timestamps
    end
  end
end
