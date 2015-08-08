class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  has_many :products_orders
  has_many :products, through: :products_orders
end
