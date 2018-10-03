class Image < ApplicationRecord
  belongs_to :category
  has_many :comments
  validates :name, presence: true

  mount_uploader :picture, PictureUploader
end
