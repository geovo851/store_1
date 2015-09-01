class AddColumnTotalSumToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :total_sum, :float
  end
end
