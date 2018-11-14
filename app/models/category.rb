class Category < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :user

  validates :title, presence: true

  acts_as_followable

end
