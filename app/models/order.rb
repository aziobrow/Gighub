class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items

  validates_presence_of :purchaser_name, :status
  before_validation :save_purchaser_name

  enum status: ['ordered', 'paid', 'cancelled', 'completed']

  def total_cost
    order_items.sum('unit_cost * quantity')
  end

private

  def save_purchaser_name
    self.purchaser_name ||= user && user.username
  end

end
