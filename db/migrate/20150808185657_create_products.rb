class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :photo
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.float :price
      t.boolean :available

      t.timestamps null: false
    end
  end
end
