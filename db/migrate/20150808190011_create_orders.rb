class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.references :payment, index: true, foreign_key: true
      t.text :delivary_adress
      t.boolean :order

      t.timestamps null: false
    end
  end
end
