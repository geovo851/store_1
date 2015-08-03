class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :good, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true
      t.float :quantity

      t.timestamps null: false
    end
  end
end
