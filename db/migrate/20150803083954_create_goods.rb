class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.integer :category_id
      t.float :price
      t.boolean :available

      t.timestamps null: false
    end
  end
end
