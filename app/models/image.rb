class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :hearts, dependent: :destroy

  validates :name, presence: true
  validates :picture, presence: true, file_size: { less_than: 50.megabytes }

  mount_uploader :picture, PictureUploader

  paginates_per 12
end
