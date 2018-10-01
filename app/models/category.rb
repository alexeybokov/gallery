class Category < ApplicationRecord
  has_many :images
  validates :title, presence: true
end
