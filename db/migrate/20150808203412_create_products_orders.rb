class CreateProductsOrders < ActiveRecord::Migration
  def change
    create_table :products_orders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.float :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
