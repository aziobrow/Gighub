class User < ApplicationRecord

  has_secure_password

  validates_presence_of :username, :email, :role

  enum role: ['default', 'admin']

end
