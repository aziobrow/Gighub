class OrderItem < ApplicationRecord

  validates_presence_of :original_unit_price, :original_unit
  validates :quantity, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :order
  belongs_to :item
  before_validation :save_original_unit_price, :save_original_unit

  enum original_unit: ['fifteen_min', 'hourly', 'daily', 'flat_rate']

  def subtotal
    original_unit_price * quantity
  end

  def format_unit
    if fifteen_min?
      "Per 15 Minutes"
    elsif hourly?
      "Per Hour"
    elsif daily?
      "Per Day"
    elsif flat_rate?
      "Flat Rate"
    end
  end

private

  def save_original_unit_price
    self.original_unit_price ||= item && item.unit_price
  end

  def save_original_unit
    self.original_unit ||= item && item.unit
  end

end
