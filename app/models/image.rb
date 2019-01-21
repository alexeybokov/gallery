class Image < ApplicationRecord
  extend FriendlyId

  belongs_to :category, counter_cache: :images_count
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :hearts, dependent: :destroy

  validates :name, presence: true
  validates :picture, presence: true, file_size: { less_than: 50.megabytes }

  friendly_id :name, use: :slugged

  mount_uploader :picture, PictureUploader

  paginates_per 15
end
