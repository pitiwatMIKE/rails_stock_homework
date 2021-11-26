class Product < ApplicationRecord
  validates :name, presence: true
  validates :qty, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :user

  has_one_attached :main_image

  # broadcasts

  # after_create_commit { broadcast_prepend_later_to "products" }

  after_create_commit { broadcast_prepend_to "products" }
  after_update_commit { broadcast_replace_to "products" }
  after_destroy_commit { broadcast_remove_to "products" }
end
