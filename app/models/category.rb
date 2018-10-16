class Category < ApplicationRecord
  has_many :images
  validates :title, presence: true

  acts_as_followable
end
