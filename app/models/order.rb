class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items

  validates_presence_of :purchaser_name, :status
  validates_associated :order_items
  before_validation :save_purchaser_name


  enum status: ['ordered', 'paid', 'cancelled', 'completed']

  def total_cost
    order_items.sum('unit_cost * quantity')
  end

  def self.by_status(status)
    where(status: status)
  end

private

  def save_purchaser_name
    self.purchaser_name ||= user && user.username
  end

end
