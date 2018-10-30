class Category < ApplicationRecord
  has_many :images
  belongs_to :user

  validates :title, presence: true

  acts_as_followable
end
