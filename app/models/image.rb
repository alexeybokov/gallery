class Image < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :hearts, dependent: :destroy
  has_many :users, through: :hearts

  validates :name, presence: true
  validates :picture, file_size: { less_than: 50.megabytes }

  mount_uploader :picture, PictureUploader

  paginates_per 5
end
