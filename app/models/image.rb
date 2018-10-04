class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  validates :name, presence: true

  mount_uploader :picture, PictureUploader
end
