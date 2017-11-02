class OrderItem < ApplicationRecord

  validates_presence_of :unit_cost, :quantity

  belongs_to :order
  belongs_to :item

  def subtotal
    unit_cost * quantity / 100.0
  end

end
