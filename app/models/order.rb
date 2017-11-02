class Order < ApplicationRecord

  validates_presence_of :shipping_address

  belongs_to :user

end
