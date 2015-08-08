class Product < ActiveRecord::Base
  belongs_to :category
  has_many :products_orders
  has_many :orders, through: :products_orders
end
