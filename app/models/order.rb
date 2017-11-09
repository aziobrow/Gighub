class Order < ApplicationRecord

  belongs_to :user
  has_many :order_items

  validates_presence_of :original_purchaser, :status
  validates_associated :order_items
  before_validation :save_original_purchaser, :save_original_address


  enum status: ['ordered', 'paid', 'cancelled', 'completed']

  def total_cost
    order_items.sum('original_unit_price * quantity')
  end

  def self.by_status(status)
    where(status: status)
  end

  def format_created_time
    created_at.strftime("%m/%d/%Y at %I:%M %p")
  end

  def format_updated_time
    updated_at.strftime("%m/%d/%Y at %I:%M %p")
  end

private

  def save_original_purchaser
    self.original_purchaser ||= user && user.name
  end

  def save_original_address
    self.original_address ||= user && user.address
  end

  def self.parse_params(params)
  if params[:status]
    where(status: params[:status])
  else
    all
  end
end

end
