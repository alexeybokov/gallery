class Image < ApplicationRecord
  belongs_to :category
  validates :name, presence: true

  mount_uploader :picture, PictureUploader
end
