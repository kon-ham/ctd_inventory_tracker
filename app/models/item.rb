class Item < ApplicationRecord
  # Table Relationship
  belongs_to :user

  # Data Validations
  validates :name, presence: true
  validates :quantity, presence: true, numericality: true
end
