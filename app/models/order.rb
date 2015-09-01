class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  has_many :products_orders, dependent: :destroy
  has_many :products, through: :products_orders

  validates :payment, :user, :delivary_adress, presence: true, if: :order
end
