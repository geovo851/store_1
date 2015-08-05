class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :payment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :delivery_adress

      t.timestamps null: false
    end
  end
end
