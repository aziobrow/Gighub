class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items

  validates_presence_of :purchaser_name, :status

  enum status: ['ordered', 'paid', 'cancelled', 'completed']

  def total_cost
    order_items.sum('cost * quantity') / 100.0
  end

end
