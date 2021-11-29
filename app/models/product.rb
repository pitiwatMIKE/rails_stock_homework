class Product < ApplicationRecord
  validates :name, presence: true
  validates :qty, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :user

  has_one_attached :main_image
end
