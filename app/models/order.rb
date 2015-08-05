class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_positions
  has_many :goods, through: :order_positions
end
