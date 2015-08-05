class CreateOrderPositions < ActiveRecord::Migration
  def change
    create_table :order_positions do |t|
      t.references :order, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
      t.float :qauntity
      t.float :price

      t.timestamps null: false
    end
  end
end
