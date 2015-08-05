class Cart < ActiveRecord::Base
  belongs_to :user  
  has_many :cart_positions
  has_many :goods, through: :cart_positions
end
