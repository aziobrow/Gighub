class User < ApplicationRecord

  has_many :orders

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :role

  enum role: ['default', 'admin']

end
