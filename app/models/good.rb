class Good < ActiveRecord::Base
  belongs_to :category
  has_many :cart_positions
  has_many :carts, through: :cart_positions
  
  has_many :order_positions
  has_many :orders, through: :order_positions
end
