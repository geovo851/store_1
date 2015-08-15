class ChangeColumnAvailableForProducts < ActiveRecord::Migration
  change_column :products, :available, :boolean, default: false
end
