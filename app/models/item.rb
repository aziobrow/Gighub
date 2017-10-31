class Item < ApplicationRecord

  validates_presence_of :title, :price, :description, :image_url

  belongs_to :category

end
