class CreateCartPositions < ActiveRecord::Migration
  def change
    create_table :cart_positions do |t|
      t.references :cart, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
      t.float :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
