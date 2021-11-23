class User < ApplicationRecord
  # Authentication
  has_secure_password

  # Table Relationship
  has_many :items

  # Data Validations
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end
