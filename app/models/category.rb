class Category < ApplicationRecord

  validates_presence_of :name

  has_many :items

  before_save :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end

end
