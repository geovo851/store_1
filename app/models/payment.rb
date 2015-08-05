class Payment < ActiveRecord::Base
  has_many :carts
end
