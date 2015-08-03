class Good < ActiveRecord::Base
  belongs_to :category
  has_many :positions
  has_many :carts, through: :positions
end
