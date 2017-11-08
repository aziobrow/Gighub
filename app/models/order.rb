class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items

  validates_presence_of :original_purchaser, :status
  validates_associated :order_items
  before_validation :save_original_purchaser


  enum status: ['ordered', 'paid', 'cancelled', 'completed']

  def total_cost
    order_items.sum('original_unit_price * quantity')
  end

  def self.by_status(status)
    where(status: status)
  end

private

  def save_original_purchaser
    self.original_purchaser ||= user && user.username
  end

  def self.parse_params(params)
  if params[:status]
    where(status: params[:status])
  else
    all
  end
end

end
