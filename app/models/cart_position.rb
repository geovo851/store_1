class CartPosition < ActiveRecord::Base
  belongs_to :cart
  belongs_to :good
end
