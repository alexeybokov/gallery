class Category < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :user
  # belongs_to :image, optional: true


  validates :title, presence: true

  acts_as_followable

  paginates_per 12
end
