class Item < ApplicationRecord

  validates_presence_of :title, :price, :description, :image_url

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
