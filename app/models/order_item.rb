class OrderItem < ApplicationRecord

  validates_presence_of :unit_cost
  validates :quantity, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :order
  belongs_to :item
  before_validation :save_unit_cost

  def subtotal
    unit_cost * quantity
  end

private

  def save_unit_cost
    self.unit_cost ||= item && item.price
  end

end
