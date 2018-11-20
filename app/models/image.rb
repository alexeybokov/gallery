class Image < ApplicationRecord
  extend FriendlyId

  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :hearts, dependent: :destroy

  validates :name, presence: true
  validates :picture, presence: true, file_size: { less_than: 50.megabytes }

  friendly_id :name, use: :slugged

  mount_uploader :picture, PictureUploader

  paginates_per 12


  private

  def should_generate_new_friendly_id?
    slug.nil? || title_changed? || location_changed?
  end
end
