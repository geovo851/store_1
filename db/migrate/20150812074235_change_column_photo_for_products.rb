class ChangeColumnPhotoForProducts < ActiveRecord::Migration
  change_column :products, :photo, :string
end
