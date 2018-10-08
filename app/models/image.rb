class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true
  has_many :comments
  validates :name, presence: true#, file_size: { less_than: 50.megabytes }
            #file_content_type: { allow: %w(image/jpg image/jpeg image/png)}

  mount_uploader :picture, PictureUploader
end
