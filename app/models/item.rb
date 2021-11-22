class Item < ApplicationRecord
    # Table Relationship
    belongs_to :user

    # Data validations
    validates :quantity, presence: true, numericality: true
    validates :name, presence: true
end
