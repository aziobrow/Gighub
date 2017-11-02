class OrderItem < ApplicationRecord

  validates_presence_of :cost, :quantity

  belongs_to :order
  belongs_to :item

end
