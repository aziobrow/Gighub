class OrderItem < ApplicationRecord

  validates_presence_of :original_unit_price
  validates :quantity, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :order
  belongs_to :item
  before_validation :save_original_unit_price

  def subtotal
    original_unit_price * quantity
  end

private

  def save_original_unit_price
    self.original_unit_price ||= item && item.unit_price
  end

end
