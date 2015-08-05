class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  has_many :cart_positions
  has_many :goods, through: :cart_positions
end
