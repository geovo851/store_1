class OrderPosition < ActiveRecord::Base
  belongs_to :order
  belongs_to :good
end
