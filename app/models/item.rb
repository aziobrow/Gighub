class Item < ApplicationRecord

  validates_presence_of :price, :description
  validates :title, presence: true, uniqueness: true

  belongs_to :category
  has_many :order_items

  def subtotal_price(quantity)
    self.price * quantity
  end

  def retired?
    !active?
  end

  def retire
    update(active: false)
  end

end
