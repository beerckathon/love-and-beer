class User < ApplicationRecord
  validates :name, presence: true
  validates :login_id, presence: true, uniqueness: true
  has_secure_password
  has_many :posts
end
